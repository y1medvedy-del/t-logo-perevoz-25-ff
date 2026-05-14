// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Modified FlutterFlow custom action with MultiPage pagination

// ========= Доп. пакеты =========
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http; // для загрузки TTF-шрифтов из Supabase

const double mm = PdfPageFormat.mm; // 1 мм в поинтах PDF
// ---- Глобальные настройки оформления PDF ----
const double kTableBorder = 0.5; // толщина рамок основных таблиц
const double kCellUnderline =
    0.2; // толщина нижнего подчеркивания в полях (№, дата и т.п.)
const double kStatusBoxBorder = 0.5; // рамка вокруг статуса "3"

const double kCellPadV =
    2.0; //  отступ в ячейке без подчеркивания показывает толшину подчеркивания полностью

// ========= Загрузка шрифтов (Roboto) из Supabase =========
Future<Map<String, pw.Font>> loadPdfFonts() async {
  const baseUrl =
      'https://supabase.t-logo.ru/storage/v1/object/public/fonts/arial';
  final urls = {
    'regular': '$baseUrl/arial.ttf',
    'bold': '$baseUrl/arialbd.ttf',
    'italic': '$baseUrl/ariali.ttf',
    'boldItalic': '$baseUrl/arialbi.ttf',
  };

  Future<Uint8List?> fetchBytesFromUrl(String? url) async {
    if (url == null || url.isEmpty) return null;
    try {
      final resp = await http.get(Uri.parse(url));
      if (resp.statusCode == 200) return resp.bodyBytes;
    } catch (e) {
      print('Ошибка загрузки изображения: $e');
    }
    return null;
  }

  final fonts = <String, pw.Font>{};
  for (final e in urls.entries) {
    final resp = await http.get(Uri.parse(e.value));
    if (resp.statusCode != 200) {
      throw Exception(
          'Не удалось загрузить шрифт: ${e.key} (${resp.statusCode})');
    }
    fonts[e.key] = pw.Font.ttf(resp.bodyBytes.buffer.asByteData());
  }
  return fonts;
}

// ========= Само действие =========
Future<String?> simgGeneratePaymentUpdFlutter(
  int applicationId, // ID заявки / документа в твоём приложении (внутренний ключ)
  String
      docNumber, // номер УПД (или счёта/документа), то что печатается в шапке
  String baseDoc, // по счету
  int ndsPercent, // процент НДС: 0, 10, 20 и т.д.
  bool ndsMode, // начисляем и вычесляем НДС
  String statusUpd, // статус УПД: 1 или 2
  String bucket, // имя bucket’а в хранилище (Supabase/S3), куда кладём PDF
  String folder, // папка внутри bucket’а (подкаталог для файла)
  int sellerId, // ID продавца в базе (организация/ИП, кто выставляет УПД)
  int buyerId, // ID покупателя в базе
  int answearId, // ID «ответственного» / связанного объекта: ответ на заявку, id связанного документа и т.п. (смотря как ты это используешь)
  bool withSign, // Наличие подписи и печати
  String shippingDate, //Дата отгрузки товара
  dynamic jsonData,
) async {
  final fonts = await loadPdfFonts();
  final theme = pw.ThemeData.withFont(
    base: fonts['regular']!,
    bold: fonts['bold']!,
    italic: fonts['italic']!,
    boldItalic: fonts['boldItalic']!,
  );

  final pdf = pw.Document(
    theme: theme,
    version: PdfVersion.pdf_1_5,
    compress: true,
  );

  final now = DateFormat('dd.MM.yyyy').format(DateTime.now());

  // Извлекаем данные из JSON
  final executer = jsonData != null ? (jsonData['executer'] ?? {}) : {};
  final client = jsonData != null ? (jsonData['client'] ?? {}) : {};

// ВСЕ ПОЛЯ ИЗ executer (как у тебя было)
  final documentName = executer['document_name'] ?? docNumber;
  final baseDocument = executer['base_document'] ?? baseDoc;
  final ndsValue = executer['nds'] ?? 'Без НДС';
  final signAndStamp = executer['sign_and_stamp'] ?? true;
  final statusValue = executer['status'] ?? statusUpd;
  final correctionNumber = executer['correction_number'] ?? '-';
  final correctionDate = executer['correction_date'] ?? '-';
  final shippersAddress = executer['shippers_address'] ?? 'Он же';
  final consigneeAddress = executer['consignee_address'] ?? 'Он же';
  final identifierAgreement = executer['identifier_agreement'] ?? '\n ';
  final transferBasis = executer['transfer_basis'] ?? baseDoc;
  final transportData = executer['transport_data'] ?? baseDoc;
  final jobTitle = executer['job_title'] ?? 'Руководитель';
  final otherInformation = executer['other_information'] ?? ' ';
  final signerName = executer['signer_name'] ?? ' ';

// НОВЫЕ ПОЛЯ ИЗ client (с префиксом client)
  final clientCompanyId = client['company_id'] ?? ' '; // 21
  final clientNds = client['nds'] ?? 'Без НДС'; // 20
  final clientSignerPosition =
      client['signer_position'] ?? 'Руководитель'; // " Руководитель Админ"
  final clientSignerName = client['signer_name'] ?? ' '; // "Админ ИИ"
  final dateSigner =
      client['signer_date'] ?? ' '; // "Дата подписание документа клиентом"

  final nf =
      NumberFormat.currency(locale: 'ru_RU', symbol: '', decimalDigits: 2);

  final seller = await SupaFlow.client
      .from('company')
      .select(
          'id,name_company,R_ur_address,INN,KPP,director_name,signature_url,stamp_url')
      .eq('id', sellerId)
      .single();

  final buyer = await SupaFlow.client
      .from('company')
      .select(
          'id,name_company,R_ur_address,INN,KPP,director_name,signature_url,stamp_url')
      .eq('id', buyerId)
      .single();

  // === Загружаем товары из work_answer ===
  final workItems = await SupaFlow.client
      .from('work_answer')
      .select('id,name_work,quantity,new_quantity,price,new_price')
      .eq('answer_id', answearId)
      .order('id', ascending: true);

  // === Загрузка данных заявки ===
  final aplication = await SupaFlow.client
      .from('aplication')
      .select(
          'city, created_at, number_car, surname_driver, name_driver, patronymic_driver')
      .eq('id', applicationId)
      .maybeSingle();

  final city = aplication?['city'] ?? '';
  final createdAtRaw = aplication != null ? aplication['created_at'] : null;
  final createdAt = createdAtRaw != null
      ? DateFormat('dd.MM.yyyy').format(DateTime.parse(createdAtRaw.toString()))
      : '';

  final numberCar = aplication?['number_car'] ?? '';
  final driverFio = [
    aplication?['surname_driver'],
    aplication?['name_driver'],
    aplication?['patronymic_driver']
  ].where((e) => e != null && e.toString().trim().isNotEmpty).join(' ');

// 3️⃣ Расчёт сумм и подготовка списка позиций
  double sumWithoutNds = 0;
  double ndsTotal = 0;
  double sumTotal = 0;

  ndsPercent = (() {
    // Если clientNds не передан — считаем, что НДС = 0
    if (clientNds == null) return 0;

    // Если уже пришло числом (например 20) — просто возвращаем
    if (clientNds is int) return clientNds as int;

    // Иначе приводим к строке и чистим пробелы
    final s = clientNds.toString().trim();

    // Пустая строка или явно "Без НДС" (любая вариация с "без") — НДС = 0
    if (s.isEmpty || s.toLowerCase().contains('без')) return 0;

    // Достаём первое число из строки (подходит для "НДС 20%" или "20")
    final m = RegExp(r'\d+').firstMatch(s);

    // Если числа нет — НДС = 0, иначе парсим число; если парсинг не удался — тоже 0
    return m == null ? 0 : (int.tryParse(m.group(0)!) ?? 0);
  })();

  final List<Map<String, dynamic>> items = [];

  for (final item in workItems) {
    // если есть новые значения — берем их, иначе старые
    final qty = ((item['new_quantity'] ?? item['quantity']) ?? 0) * 1.0;
    final price = ((item['new_price'] ?? item['price']) ?? 0) * 1.0;

    final sumRow = qty * price;
    final ndsRow = ndsMode
        ? sumRow * ndsPercent / 100 // сверху начисляем НДС
        : sumRow - (sumRow / (1 + ndsPercent / 100)); // вычитаем из суммы
    final sumRowTotal = ndsMode ? sumRow + ndsRow : sumRow;

    items.add({
      'name': item['name_work'] ?? '',
      'qty': qty,
      'price': price,
      'sumRow': sumRow,
      'ndsRow': ndsRow,
      'sumRowTotal': sumRowTotal,
    });

    sumWithoutNds += sumRow;
    ndsTotal += ndsRow;
    sumTotal += sumRowTotal;
  }

  // URL'ы из БД
  final String? sellerSignatureUrl = seller['signature_url'] as String?;
  final String? sellerStampUrl = seller['stamp_url'] as String?;
  final String? buyerSignatureUrl = buyer['signature_url'] as String?;
  final String? buyerStampUrl = buyer['stamp_url'] as String?;

// байты картинок (изначально null)
  Uint8List? sellerSignatureBytes;
  Uint8List? sellerStampBytes;
  Uint8List? buyerSignatureBytes;
  Uint8List? buyerStampBytes;

// ---- Локальная функция загрузки по URL ----
  Future<Uint8List?> _loadImage(String? url) async {
    if (url == null || url.isEmpty) return null;
    try {
      final resp = await http.get(Uri.parse(url));
      if (resp.statusCode == 200) {
        return resp.bodyBytes;
      }
    } catch (e) {
      print('Ошибка загрузки изображения: $e');
    }
    return null;
  }

// ---- Загружаем подписи/печати только если withSign == true ----
  if (withSign) {
    sellerSignatureBytes = await _loadImage(sellerSignatureUrl);
    sellerStampBytes = await _loadImage(sellerStampUrl);
    buyerSignatureBytes = await _loadImage(buyerSignatureUrl);
    buyerStampBytes = await _loadImage(buyerStampUrl);
  }

// если withSign == false,
// sellerSignatureBytes / buyerSignatureBytes / stampBytes останутся null
// и твои if (sellerSignatureBytes != null) просто ничего не нарисуют

  const double kContentWidth = 728; // фиксированная ширина контента

  pdf.addPage(
    pw.MultiPage(
      pageTheme: pw.PageTheme(
        pageFormat: PdfPageFormat.a4.landscape.copyWith(
          marginLeft: 10 * mm,
          marginRight: 10 * mm,
          marginTop: 12 * mm,
          marginBottom: 12 * mm,
        ),
      ),
      header: (context) {
        // На первой странице хедер не показываем
        if (context.pageNumber == 1) {
          return pw.SizedBox();
        }

        // Здесь можно регулировать внешние отступы хедера
        return pw.Container(
          margin: const pw.EdgeInsets.only(
            left: 10, // ← отступ слева (поменяешь под себя)
            right: 10, // ← отступ справа
            top: 6, // ← отступ сверху (чтобы было "со второй строки")
            // bottom можно тоже добавить, если захочешь
          ),
          child: pw.Table(
            columnWidths: const {
              0: pw.FixedColumnWidth(725), // правая колонка занимает остаток
              1: pw.FlexColumnWidth(), // ширина колонки "Лист X"
            },
            border: const pw.TableBorder(
              left: pw.BorderSide.none,
              right: pw.BorderSide.none,
              top: pw.BorderSide.none,
              bottom: pw.BorderSide.none,
              verticalInside: pw.BorderSide.none,
              horizontalInside: pw.BorderSide.none,
            ),
            children: [
              pw.TableRow(
                children: [
                  // ЛЕВАЯ КОЛОНКА: номер листа
                  pw.Container(
                    alignment: pw.Alignment.centerLeft,
                    child: pw.Text(
                      'Универсальный передаточный документ № $docNumber от $shippingDate',
                      style: pw.TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ),

                  // ПРАВАЯ КОЛОНКА: твой текст УПД
                  pw.Container(
                    alignment: pw.Alignment.centerLeft,
                    padding: const pw.EdgeInsets.only(right: 4),
                    child: pw.Text(
                      'Лист ${context.pageNumber}',
                      style: pw.TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      build: (context) => [
        pw.Center(
          child: pw.Container(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // === Таблица 1: ГЛАВНАЯ И ПЕРВАЯ ТАБЛИЦА ШАПКА ДОКУМЕТА ===
                pw.Table(
                  border: pw.TableBorder(
                    // убираем левые и правые линии
                    left: pw.BorderSide(color: PdfColors.white, width: 0),
                    right: pw.BorderSide(color: PdfColors.white, width: 0),

                    // верх и низ оставляем белыми (или можешь задать чёрный, если нужно)
                    top: pw.BorderSide(color: PdfColors.white, width: 0),
                    bottom: pw.BorderSide(color: PdfColors.white, width: 0),

                    // оставляем только внутреннюю вертикальную линию между колонками
                    verticalInside: pw.BorderSide(
                      color: PdfColors.black,
                      width: 0.5,
                    ),
                    // без горизонтальных
                    horizontalInside:
                        pw.BorderSide(color: PdfColors.white, width: 0),
                  ),
                  columnWidths: const {
                    0: pw.FixedColumnWidth(73.3),
                    1: pw.FixedColumnWidth(654.7),
                  },
                  children: [
                    // ==== Строка 1: Поставщик (вложенная таблица в левой колонке) ====
                    pw.TableRow(
                      children: [
                        // Левая ячейка — вложенная таблица (вместо простого текста)
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(2),
                          child: pw.Table(
                            border: pw.TableBorder(
                              left: pw.BorderSide.none,
                              right: pw.BorderSide.none,
                              top: pw.BorderSide.none,
                              bottom: pw.BorderSide.none,
                              verticalInside: pw.BorderSide.none,
                              horizontalInside: pw.BorderSide.none,
                            ),
                            children: [
                              // 1️⃣ строка — заголовок
                              pw.TableRow(
                                children: [
                                  pw.Container(
                                    alignment: pw.Alignment.topLeft,
                                    constraints:
                                        const pw.BoxConstraints(minHeight: 20),
                                    child: pw.Text(
                                      'Универсальный  передаточный  документ',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // 2️⃣ строка — пустая
                              pw.TableRow(
                                children: [
                                  pw.Container(height: 20),
                                ],
                              ),

                              // 3️⃣ строка — вложенная таблица (3 колонки)
                              pw.TableRow(
                                children: [
                                  pw.Container(
                                    constraints:
                                        const pw.BoxConstraints(minHeight: 20),
                                    child: pw.Table(
                                      // рамки белые, чтобы не было видимых линий
                                      border: pw.TableBorder(
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      // ВАЖНО: тут задаём ширины колонок!
                                      // 0 — колонка "Статус:", тянется
                                      // 1 — колонка с цифрой "3", фиксированно 24pt
                                      // 2 — пустая колонка, фиксированно 10pt
                                      columnWidths: const {
                                        0: pw.FlexColumnWidth(1),
                                        1: pw.FixedColumnWidth(15),
                                        2: pw.FixedColumnWidth(5),
                                      },
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            // Колонка 1 — "Статус:"
                                            pw.Container(
                                              alignment: pw.Alignment.center,
                                              padding: const pw.EdgeInsets.only(
                                                  top: 2),
                                              child: pw.Text(
                                                'Статус:',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),

                                            // Колонка 2 — цифра "3" с рамкой 2px
                                            pw.Container(
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                  color: PdfColors.black,
                                                  width: kStatusBoxBorder,
                                                ),
                                              ),
                                              height: 16,
                                              child: pw.Text(
                                                '$statusUpd',
                                                style: pw.TextStyle(
                                                  fontSize: 8,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                ),
                                              ),
                                            ),

                                            // Колонка 3 — пустая (ширина задаётся в columnWidths)
                                            pw.Container(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              // 4️⃣ строка — пустая
                              pw.TableRow(
                                children: [pw.Container(height: 20)],
                              ),

                              // 5️⃣ строка — подпись к статусу
                              pw.TableRow(
                                children: [
                                  pw.Container(
                                    alignment: pw.Alignment.topLeft,
                                    constraints:
                                        const pw.BoxConstraints(minHeight: 20),
                                    child: pw.Text(
                                      '1 - счет-фактура и\nпередаточный документ\n(акт)\n2 - передаточный\nдокумент (акт)',
                                      style: pw.TextStyle(fontSize: 5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // === Правая ячейка основной первой строки ===
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Table(
                            border: pw.TableBorder.all(
                                color: PdfColors.white,
                                width: 0), // белые границы
                            columnWidths: const {
                              0: pw.FlexColumnWidth(1),
                            },
                            children: [
                              // ==== 1 строка — вложенная таблица с 6 колонками ====
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(0.65),
                                      1: pw.FlexColumnWidth(0.7),
                                      2: pw.FlexColumnWidth(0.25),
                                      3: pw.FlexColumnWidth(0.7),
                                      4: pw.FlexColumnWidth(0.2),
                                      5: pw.FlexColumnWidth(
                                          2.5), // чтобы текст справа помещался
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            constraints:
                                                const pw.BoxConstraints(
                                                    minHeight: 10),
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'Счет-фактура №',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 колонка
                                          pw.Container(
                                            constraints:
                                                const pw.BoxConstraints(
                                                    minHeight: 10),
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.center,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text(
                                              docNumber,
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.center,
                                            width: 20,
                                            child: pw.Text(
                                              'от',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 4 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.center,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text(
                                              now, // docDate
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 5 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            width: 20,
                                            child: pw.Text(
                                              '-1',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 6 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerRight,
                                            child: pw.Text(
                                              'Приложение № 1 к постановлению Правительства Российской Федерации от 26 декабря 2011 г. № 1137\n(в ред. Постановления Правительства РФ от 19.08.2017 № 981)',
                                              style: pw.TextStyle(fontSize: 6),
                                              textAlign: pw.TextAlign.right,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // ==== 2 строка — вторая вложенная таблица (аналогично, "Исправление №") ====
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(0.65),
                                      1: pw.FlexColumnWidth(0.7),
                                      2: pw.FlexColumnWidth(0.25),
                                      3: pw.FlexColumnWidth(0.7),
                                      4: pw.FlexColumnWidth(0.25),
                                      5: pw.FlexColumnWidth(
                                          2.45), // чтобы текст справа помещался
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'Исправление №',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 колонка (прочерк)
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.center,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text(
                                                correctionNumber, //Коррекционный номер
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('от',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 4 колонка (прочерк)
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.center,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text(
                                                correctionDate, //Дата корректируеммого документа
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 5 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('(1а)',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 6 колонка — пустая
                                          pw.Container(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // ==== 3 СТРОКА
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(1.2),
                                      1: pw.FlexColumnWidth(3.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'Продавец:',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 колонка (прочерк)
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            //ИМЯ КОМПАНИИ ПРОДАВЦА
                                            child: pw.Text(
                                                seller['name_company'] ?? '',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('-2',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // ==== 4 СТРОКА АДРЕС ШАПКА
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(1.2),
                                      1: pw.FlexColumnWidth(3.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'Адрес:',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 АДРЕС ПРОДАВЦА ПЕРЕМННАЯ
                                          pw.Container(
                                            constraints:
                                                const pw.BoxConstraints(
                                              minHeight:
                                                  9, // минимум 9, но может расти
                                            ),
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            //ИМЯ КОМПАНИИ ПРОДАВЦА
                                            child: pw.Text(
                                                seller['R_ur_address'] ?? ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('(2а)',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // ==== 5 СТРОКА   ИНН/КПП продавца:
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(1.2),
                                      1: pw.FlexColumnWidth(3.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'ИНН/КПП продавца:',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 АДРЕС ПРОДАВЦА ПЕРЕМННАЯ
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            //  ИНН/КПП продавца:
                                            child: pw.Text(
                                                '${seller['INN'] ?? ''}  / ${seller['KPP'] ?? ''}',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('(2б)',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // ==== 6 СТРОКА     Грузоотправитель и его адрес:
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(1.2),
                                      1: pw.FlexColumnWidth(3.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'Грузоотправитель и его адрес:',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2   Грузоотправитель и его адрес:
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text(shippersAddress,
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('(-3)',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // ==== 7 СТРОКА Грузополучатель и его адрес:
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(1.2),
                                      1: pw.FlexColumnWidth(3.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'Грузополучатель и его адрес:',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2     Грузополучатель и его адрес:
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text(consigneeAddress,
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('(-4)',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // ==== 8 СТРОКА К платежно-расчетному документу №
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(1.2),
                                      1: pw.FlexColumnWidth(3.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'К платежно-расчетному документу №:',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 К платежно-расчетному документу №
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text('От',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('(-5)',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // ==== 9 СТРОКА ИМЯ ПОКУПАТЕЛЯ
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(1.2),
                                      1: pw.FlexColumnWidth(3.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'Покупатель:',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 колонка (прочерк)
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            //ИМЯ КОМПАНИИ ПОКУПАТЕЛЯ
                                            child: pw.Text(
                                                buyer['name_company'] ?? ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('-6',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // ==== 10 СТРОКА АДРЕС ПОКУПАТЕЛЯ ШАПКА
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(1.2),
                                      1: pw.FlexColumnWidth(3.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'Адрес:',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 АДРЕС ПОКУПАТЕЛЯ ПЕРЕМННАЯ
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text(
                                                buyer['R_ur_address'] ?? '',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('(6а)',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // ==== 11 СТРОКА   ИНН/КПП ПОКУПАТЕЛЯ:
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(1.2),
                                      1: pw.FlexColumnWidth(3.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'ИНН/КПП покупателя:',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 ИНН/КПП ПОКУПАТЕЛЯ:
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text(
                                                '${buyer['INN'] ?? ''} / ${buyer['KPP'] ?? ''}',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('(6б)',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // ==== 12 Валюта: наименование, код:
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(1.2),
                                      1: pw.FlexColumnWidth(3.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'Валюта: наименование, код:',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text(
                                                'Российский рубль, 643',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('(7)',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // ==== 13 СТРОКА   Идентификатор государственного контракта, договора (соглашения) (при наличии):
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder.all(
                                        color: PdfColors.white, width: 0),
                                    columnWidths: const {
                                      0: pw.FlexColumnWidth(2.2),
                                      1: pw.FlexColumnWidth(2.8),
                                      2: pw.FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          // 1 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            child: pw.Text(
                                              'Идентификатор государственного контракта, договора (соглашения) (при наличии):',
                                              style: pw.TextStyle(fontSize: 8),
                                            ),
                                          ),
                                          // 2 Колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(1),
                                            alignment: pw.Alignment.centerLeft,
                                            constraints:
                                                const pw.BoxConstraints(
                                              minHeight:
                                                  20, // минимум по высоте
                                            ),
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                bottom: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: kCellUnderline,
                                                ),
                                              ),
                                            ),
                                            child: pw.Text(identifierAgreement,
                                                style: pw.TextStyle(
                                                    fontSize: 8,
                                                    color: PdfColors.white)),
                                          ),
                                          // 3 колонка
                                          pw.Container(
                                            padding: const pw.EdgeInsets.all(
                                                kCellPadV),
                                            alignment: pw.Alignment.center,
                                            child: pw.Text('\n(8)',
                                                style:
                                                    pw.TextStyle(fontSize: 8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

// === ...всё, что было у тебя до этого места — без изменений ===

// === Закрываем первую таблицу ===
                  ],
                ),

// === Новая таблица (14 колонок) сразу после первой ===
                pw.SizedBox(height: 0), // небольшой отступ между таблицами
                pw.Table(
                  border: pw.TableBorder.all(
                    color: PdfColors.black,
                    width: kTableBorder,
                  ),
                  defaultVerticalAlignment:
                      pw.TableCellVerticalAlignment.middle,
                  columnWidths: const {
                    0: pw.FixedColumnWidth(18), // № п/п
                    1: pw.FixedColumnWidth(44), // Код товара
                    2: pw.FixedColumnWidth(80), // Наименование
                    3: pw.FixedColumnWidth(38), // Код вида товара
                    4: pw.FixedColumnWidth(46), // Ед. изм.
                    5: pw.FixedColumnWidth(38), // Кол-во
                    6: pw.FixedColumnWidth(38), // Цена
                    7: pw.FixedColumnWidth(46), // Стоимость без НДС
                    8: pw.FixedColumnWidth(42), // Ставка НДС
                    9: pw.FixedColumnWidth(42), // Сумма НДС
                    10: pw.FixedColumnWidth(42), // Стоимость с НДС
                    11: pw.FixedColumnWidth(42), // Страна происх.
                    12: pw.FixedColumnWidth(42), // ТД
                    13: pw.FixedColumnWidth(
                        58), // Примечание / добиваем до общей 616 pt
                  },
                  children: [
                    pw.TableRow(
                      children: [
                        // 1
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text('№\nп/п',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6)),
                        ),
                        // 2
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text('Код товара,\nработ, услуг',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6)),
                        ),
                        // 3
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text(
                            'Наименование товара\n(описание работ, услуг),\nимущественного\nправа',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(fontSize: 6),
                          ),
                        ),
                        // 4
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text('Код вида\nтовара',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6)),
                        ),
                        // 5 (ячейка с вложенной таблицей)
                        pw.Container(
                          padding: const pw.EdgeInsets.all(0),
                          // child = вложенная таблица на ДВЕ строки
                          child: pw.Table(
                            // без внутренних рамок (оставляем рамку только у внешней таблицы)
                            border: pw.TableBorder.all(
                                color: PdfColors.black, width: 0.5),
                            columnWidths: const {
                              0: pw.FlexColumnWidth(1),
                            },
                            defaultVerticalAlignment:
                                pw.TableCellVerticalAlignment.middle,
                            children: [
                              // ── строка 1: один столбец
                              pw.TableRow(
                                children: [
                                  pw.Container(
                                    alignment: pw.Alignment.center,
                                    padding: const pw.EdgeInsets.all(2),
                                    constraints:
                                        const pw.BoxConstraints(minHeight: 8),
                                    child: pw.Text(
                                      'Единица\nизмерения',
                                      textAlign: pw.TextAlign.center,
                                      style: pw.TextStyle(fontSize: 6),
                                    ),
                                  ),
                                ],
                              ),

                              // ── строка 2: ВНУТРИ неё ещё одна таблица на 2 колонки (без ВСЕХ границ, ширины в pt)
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    // убираем абсолютно все границы
                                    border: pw.TableBorder(
                                      left: pw.BorderSide(
                                          color: PdfColors.white, width: 0),
                                      right: pw.BorderSide(
                                          color: PdfColors.white, width: 0),
                                      top: pw.BorderSide(
                                          color: PdfColors.white, width: 0),
                                      bottom: pw.BorderSide(
                                          color: PdfColors.white, width: 0),
                                      verticalInside: pw.BorderSide(
                                          color: PdfColors.black, width: 0.5),
                                      horizontalInside: pw.BorderSide(
                                          color: PdfColors.white, width: 0),
                                    ),
                                    // ширины в pt (сумма 46 pt)
                                    columnWidths: const {
                                      0: pw.FixedColumnWidth(18), // "Код"
                                      1: pw.FixedColumnWidth(
                                          28), // "Условное обозначение"
                                    },
                                    defaultVerticalAlignment:
                                        pw.TableCellVerticalAlignment.middle,
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          pw.Container(
                                            alignment: pw.Alignment.center,
                                            padding: const pw.EdgeInsets.all(2),
                                            constraints:
                                                const pw.BoxConstraints(
                                                    minHeight: 8),
                                            child: pw.Text(
                                              'Код',
                                              textAlign: pw.TextAlign.center,
                                              style: pw.TextStyle(fontSize: 6),
                                            ),
                                          ),
                                          pw.Container(
                                            alignment: pw.Alignment.center,
                                            padding: const pw.EdgeInsets.all(2),
                                            constraints:
                                                const pw.BoxConstraints(
                                                    minHeight: 8),
                                            child: pw.Text(
                                              'Условное\nобозна-\nчение\n(нацио-\nнальное)',
                                              textAlign: pw.TextAlign.center,
                                              style: pw.TextStyle(fontSize: 6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // 6
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text('Коли-\nчество\n(объем)',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6)),
                        ),
                        // 7
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text('Цена\n(тариф)\nза единицу\nизмерения',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6)),
                        ),
                        // 8
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text(
                              'Стоимость\nтоваров (работ,\nуслуг),\nимущественных\nправ без налога -\nвсего',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6)),
                        ),
                        // 9
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text('В том\nчисле\nсумма\nакциза',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6)),
                        ),
                        // 10
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text('Налоговая\nставка',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6)),
                        ),
                        // 11
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text(
                              'Сумма налога,\nпредъяв-\nляемая\nпокупателю',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6)),
                        ),
                        // 12
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text(
                              'Стоимость\nтоваров (работ,\nуслуг),\nимущественных\nправ с налога -\nвсего',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6)),
                        ),
// 13
                        pw.Container(
                          padding: const pw.EdgeInsets.all(0),
                          // главная вложенная таблица (ЗАГОЛОВОК + внутренняя таблица на 2 колонки)
                          child: pw.Table(
                            // убираем ВСЕ внешние границы у главной вложенной таблицы
                            border: pw.TableBorder(
                              left: pw.BorderSide(
                                  color: PdfColors.white, width: 0),
                              right: pw.BorderSide(
                                  color: PdfColors.white, width: 0),
                              top: pw.BorderSide(
                                  color: PdfColors.white, width: 0),
                              bottom: pw.BorderSide(
                                  color: PdfColors.white, width: 0),
                              verticalInside: pw.BorderSide(
                                  color: PdfColors.white, width: 0),
                              horizontalInside: pw.BorderSide(
                                  color: PdfColors.black, width: 0.5),
                            ),
                            // ширина единственной колонки = 42 pt (под ширину внешней колонки таблицы)
                            columnWidths: const {
                              0: pw.FixedColumnWidth(42),
                            },
                            defaultVerticalAlignment:
                                pw.TableCellVerticalAlignment.middle,
                            children: [
                              // ── строка 1: заголовок "Страна происхождения товара"
                              pw.TableRow(
                                children: [
                                  pw.Container(
                                    alignment: pw.Alignment.center,
                                    padding: const pw.EdgeInsets.all(2),
                                    constraints:
                                        const pw.BoxConstraints(minHeight: 8),
                                    child: pw.Text(
                                      'Страна\nпроисхождения\nтовара',
                                      textAlign: pw.TextAlign.center,
                                      style: pw.TextStyle(fontSize: 6),
                                    ),
                                  ),
                                ],
                              ),

                              // ── строка 2: внутренняя таблица на 2 колонки (только вертикальная линия)
                              pw.TableRow(
                                children: [
                                  pw.Table(
                                    border: pw.TableBorder(
                                      left: pw.BorderSide(
                                          color: PdfColors.white, width: 0),
                                      right: pw.BorderSide(
                                          color: PdfColors.white, width: 0),
                                      top: pw.BorderSide(
                                          color: PdfColors.white, width: 0),
                                      bottom: pw.BorderSide(
                                          color: PdfColors.white, width: 0),
                                      verticalInside: pw.BorderSide(
                                          color: PdfColors.black, width: 0.5),
                                      horizontalInside: pw.BorderSide(
                                          color: PdfColors.white, width: 0),
                                    ),
                                    // фикс-ширины подколонок: 20 + 22 = 42 pt
                                    columnWidths: const {
                                      0: pw.FixedColumnWidth(
                                          19), // "цифровой код"
                                      1: pw.FixedColumnWidth(
                                          23), // "краткое наименование"
                                    },
                                    defaultVerticalAlignment:
                                        pw.TableCellVerticalAlignment.middle,
                                    children: [
                                      pw.TableRow(
                                        children: [
                                          pw.Container(
                                            alignment: pw.Alignment.center,
                                            padding: const pw.EdgeInsets.all(2),
                                            constraints:
                                                const pw.BoxConstraints(
                                                    minHeight: 31),
                                            child: pw.Text(
                                              'циф\nровой\nкод',
                                              textAlign: pw.TextAlign.center,
                                              style: pw.TextStyle(fontSize: 6),
                                            ),
                                          ),
                                          pw.Container(
                                            alignment: pw.Alignment.center,
                                            padding: const pw.EdgeInsets.all(2),
                                            constraints:
                                                const pw.BoxConstraints(
                                                    minHeight: 31),
                                            child: pw.Text(
                                              'краткое\nнаиме-\nнование',
                                              textAlign: pw.TextAlign.center,
                                              style: pw.TextStyle(fontSize: 6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // 14
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(2),
                          constraints: const pw.BoxConstraints(minHeight: 16),
                          child: pw.Text(
                            'Регистрационный\nномер таможенной\nдекларации',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(fontSize: 6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ), // ← закрывает pw.Table (14 колонок)

                // === Новая таблица (16 колонок) 616 pt ===
                pw.SizedBox(height: 0),
                pw.Table(
                  border: pw.TableBorder(
                    top: pw.BorderSide(color: PdfColors.black, width: 0.5),
                    left: pw.BorderSide(color: PdfColors.black, width: 0.5),
                    right: pw.BorderSide(color: PdfColors.black, width: 0.5),
                    bottom: pw.BorderSide(color: PdfColors.black, width: 0.5),
                    verticalInside: pw.BorderSide(
                        color: PdfColors.black, width: kTableBorder),
                    horizontalInside: pw.BorderSide(
                        color: PdfColors.black, width: kTableBorder),
                  ),
                  defaultVerticalAlignment:
                      pw.TableCellVerticalAlignment.middle,
                  columnWidths: const {
                    0: pw.FixedColumnWidth(18), // №
                    1: pw.FixedColumnWidth(44), // Код товара/
                    2: pw.FixedColumnWidth(80), // Наименование товара
                    3: pw.FixedColumnWidth(38), // Код вида товара
                    4: pw.FixedColumnWidth(18), // Единица измерения
                    5: pw.FixedColumnWidth(28), // Единица измерения
                    6: pw.FixedColumnWidth(38), // Коли-чество (объем)
                    7: pw.FixedColumnWidth(
                        38), // Цена (тариф) за единицу измерения
                    8: pw.FixedColumnWidth(
                        46), // Стоимость товаров (работ, услуг), имущественных прав без налога - всего
                    9: pw.FixedColumnWidth(42), // В том числе сумма акциза
                    10: pw.FixedColumnWidth(42), // Налоговая ставка
                    11: pw.FixedColumnWidth(
                        42), // Сумма налога, предъяв-ляемая покупателю
                    12: pw.FixedColumnWidth(
                        42), // Стоимость товаров (работ, услуг), имущественных прав с налогом - всего
                    13: pw.FixedColumnWidth(19), // циф- ровой код
                    14: pw.FixedColumnWidth(23), // "краткое наиме-нование
                    15: pw.FixedColumnWidth(
                        58), // Регистрационный номер таможенной декларации
                  },
                  children: [
                    // === Шапка ===
                    pw.TableRow(
                      children: [
                        ...[
                          'А',
                          'Б',
                          '1',
                          '1а',
                          '2',
                          '2а',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '10а',
                          '11'
                        ].map(
                          (text) => pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            constraints: const pw.BoxConstraints(minHeight: 16),
                            child: pw.Text(
                              text,
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 6),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // === Тело таблицы (цикл по товарам) ===
                    ...List.generate(items.length, (i) {
                      final item = items[i];
                      return pw.TableRow(
                        children: [
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text('${i + 1}',
                                style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child:
                                pw.Text('-', style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(
                              i == 0
                                  ? '${item['name']} (г. $city, $createdAt, $numberCar, $driverFio)'
                                  : item['name'],
                              style: pw.TextStyle(fontSize: 6),
                            ),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child:
                                pw.Text('-', style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child:
                                pw.Text('-', style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child:
                                pw.Text('шт', style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text('${item['qty']}',
                                style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(item['price'].toStringAsFixed(2),
                                style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(item['sumRow'].toStringAsFixed(2),
                                style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child:
                                pw.Text('-', style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(
                                ndsPercent == 0 ? 'Без НДС' : '$ndsPercent%',
                                style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(item['ndsRow'].toStringAsFixed(2),
                                style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(
                                item['sumRowTotal'].toStringAsFixed(2),
                                style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child:
                                pw.Text('-', style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child:
                                pw.Text('-', style: pw.TextStyle(fontSize: 6)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child:
                                pw.Text('-', style: pw.TextStyle(fontSize: 6)),
                          ),
                        ],
                      );
                    }),
                  ],
                ), //Закрытие таблицы номер 3

// === Итоговая строка (6 колонок, с правым "отступом" вместо 7-й колонки) ===
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                    right: 127.5, // ширина колонок 13+14+15 = 19+23+58
                  ),
                  child: pw.Table(
                    columnWidths: const {
                      0: pw.FixedColumnWidth(62),
                      1: pw.FixedColumnWidth(240),
                      2: pw.FixedColumnWidth(46),
                      3: pw.FixedColumnWidth(84),
                      4: pw.FixedColumnWidth(42),
                      5: pw.FixedColumnWidth(42),
                    },
                    border: pw.TableBorder(
                      top: pw.BorderSide.none,
                      bottom: pw.BorderSide(color: PdfColors.black, width: 0.5),
                      left: pw.BorderSide(color: PdfColors.black, width: 0.5),
                      right: pw.BorderSide(color: PdfColors.black, width: 0.5),
                      verticalInside:
                          pw.BorderSide(color: PdfColors.black, width: 0.5),
                      horizontalInside: pw.BorderSide.none,
                    ),
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    children: [
                      pw.TableRow(
                        children: [
                          // 1
                          pw.Container(
                            alignment: pw.Alignment.centerRight,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(
                              'Пусто',
                              style: pw.TextStyle(
                                fontSize: 6,
                                color: PdfColors.white,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ),

                          // 2
                          pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(
                              'Всего к оплате:',
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ),

                          // 3
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(
                              sumWithoutNds.toStringAsFixed(2),
                              style: pw.TextStyle(fontSize: 6),
                            ),
                          ),

                          // 4
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child:
                                pw.Text('X', style: pw.TextStyle(fontSize: 6)),
                          ),

                          // 5
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(
                              ndsTotal.toStringAsFixed(2),
                              style: pw.TextStyle(fontSize: 6),
                            ),
                          ),

                          // 6
                          pw.Container(
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Text(
                              sumTotal.toStringAsFixed(2),
                              style: pw.TextStyle(
                                fontSize: 6,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ), //конец таблицы
                //Таблица колличество страниц и подписи главбуха
                pw.Container(
                  width: 842, // общая ширина строки
                  child: pw.Table(
                    columnWidths: const {
                      0: pw.FixedColumnWidth(84.7), // "Документ составлен..."
                      1: pw.FixedColumnWidth(
                          758), // блок подписей (продавец + покупатель)
                    },
                    border: const pw.TableBorder(
                      left: pw.BorderSide.none,
                      right: pw.BorderSide.none,
                      top: pw.BorderSide.none,
                      bottom: pw.BorderSide.none,
                      verticalInside: pw.BorderSide.none,
                      horizontalInside: pw.BorderSide.none,
                    ),
                    children: [
                      pw.TableRow(
                        children: [
                          // ===== ЛЕВАЯ КОЛОНКА: ДИНАМИЧЕСКИЙ ТЕКСТ =====
                          pw.Container(
                            padding: const pw.EdgeInsets.fromLTRB(2, 0, 2, 0),
                            alignment: pw.Alignment.topLeft,
                            child: pw.Text(
                              ' ', //'Документ составлен\nна ${context.pagesCount} листах'
                              style: pw.TextStyle(fontSize: 8),
                            ),
                          ),

                          // [1] Правая большая колонка: подписи/печати НИЖНИМ слоем + таблица СВЕРХУ
                          pw.Container(
                            alignment: pw.Alignment.topLeft,
                            padding: pw.EdgeInsets.zero,
                            child: pw.Stack(
                              children: [
                                // ---------- НИЖНИЙ СЛОЙ (фон): подписи и печати ----------
                                // Продавец: подпись под ячейкой "Подпись" (левая подтаблица)
                                if (sellerSignatureBytes != null)
                                  pw.Positioned(
                                    left: 168 +
                                        2, // ширина колонки "роль" (148) + небольшой отступ
                                    top: 0, // подгони по месту
                                    child: pw.Image(
                                      pw.MemoryImage(sellerSignatureBytes),
                                      width: 90,
                                      height: 20,
                                      fit: pw.BoxFit.contain,
                                    ),
                                  ),

                                // Продавец: подпись (примерное место, двигай по месту)
                                if (sellerSignatureBytes != null)
                                  pw.Positioned(
                                    left: 168,
                                    top: 25,
                                    child: pw.Image(
                                      pw.MemoryImage(sellerSignatureBytes),
                                      width: 90,
                                      height: 20,
                                      fit: pw.BoxFit.contain,
                                    ),
                                  ),

                                // Покупатель: подпись — правая подтаблица начинается после 360 + 8.7
                                if (sellerSignatureBytes != null)
                                  pw.Positioned(
                                    left: 360 +
                                        8.7 +
                                        148 +
                                        2, // левый блок + зазор + колонка "роль" + отступ
                                    top: 0,
                                    child: pw.Image(
                                      pw.MemoryImage(sellerSignatureBytes),
                                      width: 90,
                                      height: 20,
                                      fit: pw.BoxFit.contain,
                                    ),
                                  ),

                                // ---------- ВЕРХНИЙ СЛОЙ: твоя исходная таблица (линии/текст) ----------
                                pw.Table(
                                  columnWidths: const {
                                    0: pw.FixedColumnWidth(
                                        360), // левая подтаблица (продавец)
                                    1: pw.FixedColumnWidth(8.7), // узкий зазор
                                    2: pw.FixedColumnWidth(
                                        360), // правая подтаблица (покупатель)
                                  },
                                  border: const pw.TableBorder(
                                    left: pw.BorderSide(
                                        color: PdfColors.black, width: 0.5),
                                    right: pw.BorderSide.none,
                                    top: pw.BorderSide.none,
                                    bottom: pw.BorderSide(
                                        color: PdfColors.black, width: 0.5),
                                    verticalInside: pw.BorderSide.none,
                                    horizontalInside: pw.BorderSide.none,
                                  ),
                                  children: [
                                    pw.TableRow(
                                      children: [
                                        // ====== ЛЕВАЯ ПОДТАБЛИЦА (ПРОДАВЕЦ) ======
                                        pw.Container(
                                          alignment: pw.Alignment.centerLeft,
                                          padding: const pw.EdgeInsets.all(2),
                                          child: pw.Table(
                                            columnWidths: const {
                                              0: pw.FixedColumnWidth(
                                                  148.0), // роль
                                              1: pw.FixedColumnWidth(
                                                  92.5), // подпись (линия)
                                              2: pw.FixedColumnWidth(
                                                  18.5), // узкая
                                              3: pw.FixedColumnWidth(
                                                  111.0), // ФИО (линия)
                                            },
                                            border: const pw.TableBorder(
                                              left: pw.BorderSide.none,
                                              right: pw.BorderSide.none,
                                              top: pw.BorderSide.none,
                                              bottom: pw.BorderSide.none,
                                              verticalInside:
                                                  pw.BorderSide.none,
                                              horizontalInside:
                                                  pw.BorderSide.none,
                                            ),
                                            defaultVerticalAlignment: pw
                                                .TableCellVerticalAlignment
                                                .middle,
                                            children: [
                                              // строка 1: Руководитель
                                              pw.TableRow(
                                                children: [
                                                  pw.Container(
                                                    padding: const pw
                                                        .EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 2),
                                                    child: pw.Text(
                                                      'Руководитель организации или иное уполномоченное лицо',
                                                      style: pw.TextStyle(
                                                          fontSize: 6),
                                                    ),
                                                  ),
                                                  pw.Container(
                                                    height: 18,
                                                    padding: const pw
                                                        .EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                    alignment:
                                                        pw.Alignment.center,
                                                    decoration: const pw
                                                        .BoxDecoration(),
                                                    child: pw.Text(
                                                      ' ',
                                                      style: pw.TextStyle(
                                                          fontSize: 6),
                                                      textAlign:
                                                          pw.TextAlign.center,
                                                    ),
                                                  ),
                                                  pw.SizedBox(),
                                                  pw.Container(
                                                    padding:
                                                        const pw.EdgeInsets.all(
                                                            2),
                                                    alignment:
                                                        pw.Alignment.center,
                                                    child: pw.Text(
                                                      signerName != null &&
                                                              signerName
                                                                  .toString()
                                                                  .trim()
                                                                  .isNotEmpty
                                                          ? signerName
                                                          : (seller[
                                                                  'director_name'] ??
                                                              ' '),
                                                      style: pw.TextStyle(
                                                          fontSize: 8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // строка 2: подписи под руководителем
                                              pw.TableRow(
                                                children: [
                                                  pw.SizedBox(),
                                                  pw.Container(
                                                      padding: const pw
                                                          .EdgeInsets.all(2),
                                                      alignment:
                                                          pw.Alignment.center,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border(
                                                          top: pw.BorderSide(
                                                            color:
                                                                PdfColors.black,
                                                            width: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                      child: pw.Text(
                                                          '(подпись)',
                                                          style: pw.TextStyle(
                                                              fontSize: 6))),
                                                  pw.SizedBox(),
                                                  pw.Container(
                                                    padding:
                                                        const pw.EdgeInsets.all(
                                                            2),
                                                    alignment:
                                                        pw.Alignment.center,
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border(
                                                        top: pw.BorderSide(
                                                          color:
                                                              PdfColors.black,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                    ),
                                                    child: pw.Text(
                                                      '(ф.и.о.)',
                                                      style: pw.TextStyle(
                                                          fontSize: 6),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              // строка 3: Индивидуальный предприниматель
                                              pw.TableRow(
                                                children: [
                                                  pw.Container(
                                                    padding: const pw
                                                        .EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 2),
                                                    child: pw.Text(
                                                      'Индивидуальный предприниматель или иное уполномоченное лицо',
                                                      style: pw.TextStyle(
                                                          fontSize: 6),
                                                    ),
                                                  ),
                                                  pw.Container(
                                                    height: 18,
                                                    padding: const pw
                                                        .EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                    alignment:
                                                        pw.Alignment.center,
                                                    decoration:
                                                        const pw.BoxDecoration(
                                                      border: pw.Border(
                                                        bottom: pw.BorderSide(
                                                            color:
                                                                PdfColors.black,
                                                            width: 0.5),
                                                      ),
                                                    ),
                                                    child: pw.Text(
                                                      ' ',
                                                      style: pw.TextStyle(
                                                          fontSize: 6),
                                                      textAlign:
                                                          pw.TextAlign.center,
                                                    ),
                                                  ),
                                                  pw.SizedBox(),
                                                  pw.Container(
                                                    padding:
                                                        const pw.EdgeInsets.all(
                                                            2),
                                                    alignment:
                                                        pw.Alignment.center,
                                                    child: pw.Text(
                                                      signerName != null &&
                                                              signerName
                                                                  .toString()
                                                                  .trim()
                                                                  .isNotEmpty
                                                          ? signerName
                                                          : (seller[
                                                                  'director_name'] ??
                                                              ' '),
                                                      style: pw.TextStyle(
                                                          fontSize: 8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // строка 4: подписи под ИП
                                              pw.TableRow(
                                                children: [
                                                  pw.SizedBox(),
                                                  pw.Container(
                                                      padding: const pw
                                                          .EdgeInsets.all(2),
                                                      alignment:
                                                          pw.Alignment.center,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border(
                                                          top: pw.BorderSide(
                                                            color:
                                                                PdfColors.black,
                                                            width: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                      child: pw.Text(
                                                          '(подпись)',
                                                          style: pw.TextStyle(
                                                              fontSize: 6))),
                                                  pw.SizedBox(),
                                                  pw.Container(
                                                    padding:
                                                        const pw.EdgeInsets.all(
                                                            2),
                                                    alignment:
                                                        pw.Alignment.center,
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border(
                                                        top: pw.BorderSide(
                                                          color:
                                                              PdfColors.black,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                    ),
                                                    child: pw.Text(
                                                      '(ф.и.о.)',
                                                      style: pw.TextStyle(
                                                          fontSize: 6),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        // ====== СРЕДНЯЯ УЗКАЯ КОЛОНКА ======
                                        pw.Container(),

                                        // ====== ПРАВАЯ ПОДТАБЛИЦА (ПОКУПАТЕЛЬ) ======
                                        pw.Container(
                                          alignment: pw.Alignment.centerLeft,
                                          padding: const pw.EdgeInsets.all(2),
                                          child: pw.Table(
                                            columnWidths: const {
                                              0: pw.FixedColumnWidth(148.0),
                                              1: pw.FixedColumnWidth(92.5),
                                              2: pw.FixedColumnWidth(18.5),
                                              3: pw.FixedColumnWidth(111.0),
                                            },
                                            border: const pw.TableBorder(
                                              left: pw.BorderSide.none,
                                              right: pw.BorderSide.none,
                                              top: pw.BorderSide.none,
                                              bottom: pw.BorderSide.none,
                                              verticalInside:
                                                  pw.BorderSide.none,
                                              horizontalInside:
                                                  pw.BorderSide.none,
                                            ),
                                            defaultVerticalAlignment: pw
                                                .TableCellVerticalAlignment
                                                .middle,
                                            children: [
                                              pw.TableRow(
                                                children: [
                                                  pw.Container(
                                                    padding: const pw
                                                        .EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 2),
                                                    child: pw.Text(
                                                      'Главный бухгалтер или иное уполномоченное лицо',
                                                      style: pw.TextStyle(
                                                          fontSize: 6),
                                                    ),
                                                  ),
                                                  pw.Container(
                                                    height: 18,
                                                    padding: const pw
                                                        .EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                    decoration:
                                                        const pw.BoxDecoration(
                                                      border: pw.Border(
                                                        bottom: pw.BorderSide(
                                                            color:
                                                                PdfColors.black,
                                                            width: 0.5),
                                                      ),
                                                    ),
                                                  ),
                                                  pw.SizedBox(),
                                                  pw.Container(
                                                    padding:
                                                        const pw.EdgeInsets.all(
                                                            2),
                                                    alignment:
                                                        pw.Alignment.center,
                                                    child: pw.Text(
                                                      signerName != null &&
                                                              signerName
                                                                  .toString()
                                                                  .trim()
                                                                  .isNotEmpty
                                                          ? signerName
                                                          : (seller[
                                                                  'director_name'] ??
                                                              ' '),
                                                      style: pw.TextStyle(
                                                          fontSize: 8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              pw.TableRow(
                                                children: [
                                                  pw.SizedBox(),
                                                  pw.Container(
                                                      padding: const pw
                                                          .EdgeInsets.all(2),
                                                      alignment:
                                                          pw.Alignment.center,
                                                      decoration:
                                                          pw.BoxDecoration(
                                                        border: pw.Border(
                                                          top: pw.BorderSide(
                                                            color:
                                                                PdfColors.black,
                                                            width: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                      child: pw.Text(
                                                          '(подпись)',
                                                          style: pw.TextStyle(
                                                              fontSize: 6))),
                                                  pw.SizedBox(),
                                                  pw.Container(
                                                    padding:
                                                        const pw.EdgeInsets.all(
                                                            2),
                                                    alignment:
                                                        pw.Alignment.center,
                                                    decoration:
                                                        pw.BoxDecoration(
                                                      border: pw.Border(
                                                        top: pw.BorderSide(
                                                          color:
                                                              PdfColors.black,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                    ),
                                                    child: pw.Text(
                                                      '(ф.и.о.)',
                                                      style: pw.TextStyle(
                                                          fontSize: 6),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              // при необходимости — добавляешь ещё строки ниже
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                // ======== ТАБЛИЦА ОСНОВНАЯ:
                // 2 строки × 3 колонки Основание передачи (сдачи) / получения (приемки) ========
                pw.SizedBox(height: 2),
                pw.Table(
                  border: pw.TableBorder(
                    top: pw.BorderSide.none,
                    bottom: pw.BorderSide.none,
                    left: pw.BorderSide.none,
                    right: pw.BorderSide.none,
                    verticalInside: pw.BorderSide.none,
                    horizontalInside: pw.BorderSide.none,
                  ),
                  columnWidths: const {
                    0: pw.FixedColumnWidth(254),
                    1: pw.FixedColumnWidth(570),
                    2: pw.FixedColumnWidth(18),
                  },
                  defaultVerticalAlignment:
                      pw.TableCellVerticalAlignment.middle,
                  children: [
                    pw.TableRow(
                      children: [
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: pw.Text(
                            'Основание передачи (сдачи) / получения (приемки)',
                            style: pw.TextStyle(fontSize: 8),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: pw.Text(
                            baseDoc,
                            style: pw.TextStyle(fontSize: 8),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: pw.Text(
                            '(8)',
                            style: pw.TextStyle(fontSize: 8),
                          ),
                        ),
                      ],
                    ),
                    pw.TableRow(
                      children: [
                        pw.Container(
                          height: 8,
                          alignment: pw.Alignment.centerLeft,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: pw.Text(
                            ' ',
                            style: pw.TextStyle(fontSize: 6),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.center,
                          height: 8,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                              top: pw.BorderSide(
                                color: PdfColors.black,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: pw.Text(
                            '(договор; доверенность и др.)',
                            style: pw.TextStyle(fontSize: 6),
                          ),
                        ),
                        pw.Container(
                          height: 8,
                          alignment: pw.Alignment.centerLeft,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: pw.Text(
                            ' ',
                            style: pw.TextStyle(fontSize: 6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // ======== ТАБЛИЦА ОСНОВНАЯ: вторая строка
                // 2 строки × 3 колонки Данные о транспортировке и грузе ========
                pw.SizedBox(height: 2),
                pw.Table(
                  border: pw.TableBorder(
                    top: pw.BorderSide.none,
                    bottom: pw.BorderSide.none,
                    left: pw.BorderSide.none,
                    right: pw.BorderSide.none,
                    verticalInside: pw.BorderSide.none,
                    horizontalInside: pw.BorderSide.none,
                  ),
                  columnWidths: const {
                    0: pw.FixedColumnWidth(160),
                    1: pw.FixedColumnWidth(664),
                    2: pw.FixedColumnWidth(18),
                  },
                  defaultVerticalAlignment:
                      pw.TableCellVerticalAlignment.middle,
                  children: [
                    pw.TableRow(
                      children: [
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: pw.Text(
                            'Данные о транспортировке и грузе',
                            style: pw.TextStyle(fontSize: 8),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.bottomLeft,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: pw.Text(
                            transportData,
                            style: pw.TextStyle(fontSize: 8),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.bottomCenter,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: pw.Text(
                            '(9)',
                            style: pw.TextStyle(fontSize: 8),
                          ),
                        ),
                      ],
                    ),
                    pw.TableRow(
                      children: [
                        pw.Container(
                          height: 8,
                          alignment: pw.Alignment.centerLeft,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: pw.Text(
                            ' ',
                            style: pw.TextStyle(fontSize: 6),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.center,
                          height: 8,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                              top: pw.BorderSide(
                                color: PdfColors.black,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: pw.Text(
                            '(транспортная накладная, поручение экспедитору, экспедиторская / складская расписка и др. / масса нетто/ брутто груза, если не приведены ссылки на транспортные документы, содержащие эти сведения)',
                            style: pw.TextStyle(fontSize: 6),
                          ),
                        ),
                        pw.Container(
                          height: 8,
                          alignment: pw.Alignment.centerLeft,
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: pw.Text(
                            ' ',
                            style: pw.TextStyle(fontSize: 6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // ======== ТАБЛИЦА ОСНОВНАЯ: Завершающий блок с подписями
                // 2 колонки с вложенными таблицами "Товар (груз) передал / получил"
                pw.SizedBox(height: 2),
                pw.Container(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Stack(
                    children: [
                      // ===== НИЖНИЙ СЛОЙ: подписи и печати поверх таблицы =====

                      // Подпись ПРОДАВЦА (левая половина, первая строка "Руководитель / Подпись / ФИО") sellerStampBytes
                      if (sellerSignatureBytes != null)
                        pw.Positioned(
                          // 120 (колонка "Руководитель") + 10 (пробел) + 20 внутрь "Подпись"
                          left: 120 + 10 + 20,
                          top: 8, // подгони по месту
                          child: pw.Image(
                            pw.MemoryImage(sellerSignatureBytes),
                            width: 80,
                            height: 20,
                            fit: pw.BoxFit.contain,
                          ),
                        ),

                      if (sellerSignatureBytes != null)
                        pw.Positioned(
                          // 120 (колонка "Руководитель") + 10 (пробел) + 20 внутрь "Подпись"
                          left: 120 + 10 + 20,
                          top: 85, // подгони по месту
                          child: pw.Image(
                            pw.MemoryImage(sellerSignatureBytes),
                            width: 80,
                            height: 20,
                            fit: pw.BoxFit.contain,
                          ),
                        ),

                      // Печать ПРОДАВЦА — рядом со "М.П." слева (если нужна)
                      if (sellerStampBytes != null)
                        pw.Positioned(
                          left: 10, // подгони по месту
                          top: 60, // подгони по месту
                          child: pw.Image(
                            pw.MemoryImage(sellerStampBytes),
                            width: 92,
                            height: 92,
                            fit: pw.BoxFit.contain,
                          ),
                        ),

                      // Подпись ПОКУПАТЕЛЯ (правая половина, первая строка "Руководитель / Подпись / ФИО")
                      if (buyerSignatureBytes != null)
                        pw.Positioned(
                          // правая область начинается с 421 pt
                          // 421 (левая часть) + 120 (Руководитель) + 10 (пробел) + 20 внутрь "Подпись"
                          left: 421 + 120 + 10,
                          top: 8, // подгони по месту
                          child: pw.Image(
                            pw.MemoryImage(buyerSignatureBytes),
                            width: 80,
                            height: 20,
                            fit: pw.BoxFit.contain,
                          ),
                        ),

                      // Подпись ПОКУПАТЕЛЯ (правая половина, вторая строка "Руководитель / Подпись / ФИО")
                      if (buyerSignatureBytes != null)
                        pw.Positioned(
                          // правая область начинается с 421 pt
                          // 421 (левая часть) + 120 (Руководитель) + 10 (пробел) + 20 внутрь "Подпись"
                          left: 421 + 120 + 10,
                          top: 85, // подгони по месту
                          child: pw.Image(
                            pw.MemoryImage(buyerSignatureBytes),
                            width: 80,
                            height: 20,
                            fit: pw.BoxFit.contain,
                          ),
                        ),

                      // Печать ПОКУПАТЕЛЯ — рядом со "М.П." справа
                      if (buyerStampBytes != null)
                        pw.Positioned(
                          left: 421, // подгони по месту
                          top: 60, // подгони по месту
                          child: pw.Image(
                            pw.MemoryImage(buyerStampBytes),
                            width: 92,
                            height: 92,
                            fit: pw.BoxFit.contain,
                          ),
                        ),

                      // ===== ВЕРХНИЙ СЛОЙ: ТВОЯ ИСХОДНАЯ ТАБЛИЦА БЕЗ ИЗМЕНЕНИЙ =====
                      pw.Table(
                        border: pw.TableBorder(
                          top: pw.BorderSide.none,
                          bottom: pw.BorderSide.none,
                          left: pw.BorderSide.none,
                          right: pw.BorderSide.none,
                          verticalInside:
                              pw.BorderSide(color: PdfColors.black, width: 0.5),
                          horizontalInside: pw.BorderSide.none,
                        ),
                        columnWidths: const {
                          0: pw.FixedColumnWidth(421), // левая большая область
                          1: pw.FixedColumnWidth(421), // правая большая область
                        },
                        defaultVerticalAlignment:
                            pw.TableCellVerticalAlignment.top,
                        children: [
                          pw.TableRow(
                            children: [
                              // ===== ЛЕВАЯ КОЛОНКА (вложенные таблицы слева) =====
                              pw.Container(
                                padding: const pw.EdgeInsets.all(2),
                                child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    // Таблица 1 слева
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(421),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      defaultVerticalAlignment:
                                          pw.TableCellVerticalAlignment.middle,
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                'Товар (груз) передал / услуги, результаты работ, права сдал',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 2 слева
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(120),
                                        1: pw.FixedColumnWidth(10),
                                        2: pw.FixedColumnWidth(120),
                                        3: pw.FixedColumnWidth(10),
                                        4: pw.FixedColumnWidth(120),
                                        5: pw.FixedColumnWidth(41),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                jobTitle,
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ', //ПОДПИСЬ
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                signerName != null &&
                                                        signerName
                                                            .toString()
                                                            .trim()
                                                            .isNotEmpty
                                                    ? signerName
                                                    : (seller[
                                                            'director_name'] ??
                                                        ' '),
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                '(10)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(должность)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(подпись)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(ф.и.о.)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 3 слева
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(170),
                                        1: pw.FixedColumnWidth(10),
                                        2: pw.FixedColumnWidth(130),
                                        3: pw.FixedColumnWidth(70),
                                        4: pw.FixedColumnWidth(41),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                'Дата отгрузки, передачи (сдачи)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                shippingDate,
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                '(11)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 4 слева
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(421),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      defaultVerticalAlignment:
                                          pw.TableCellVerticalAlignment.middle,
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                'Иные сведения об отгрузке, передаче',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 5 слева
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(380),
                                        1: pw.FixedColumnWidth(41),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                otherInformation,
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                '(12)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(ссылки на неотъемлемые приложения, сопутствующие документы, иные документы и т.п.) ',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 6 слева
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(120),
                                        1: pw.FixedColumnWidth(10),
                                        2: pw.FixedColumnWidth(120),
                                        3: pw.FixedColumnWidth(10),
                                        4: pw.FixedColumnWidth(120),
                                        5: pw.FixedColumnWidth(41),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                jobTitle,
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ', //ПОДПИСЬ
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                signerName != null &&
                                                        signerName
                                                            .toString()
                                                            .trim()
                                                            .isNotEmpty
                                                    ? signerName
                                                    : (seller[
                                                            'director_name'] ??
                                                        ' '),
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                '(13)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(должность)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(подпись)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(ф.и.о.)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 7 слева
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(421),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      defaultVerticalAlignment:
                                          pw.TableCellVerticalAlignment.middle,
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(1),
                                              child: pw.Text(
                                                'Наименование экономического субъекта – составителя документа (в т.ч. комиссионера / агента)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 8 слева
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(380),
                                        1: pw.FixedColumnWidth(41),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                '${seller['name_company'] ?? ''} '
                                                'ИНН: ${seller['INN'] ?? ''}  КПП: ${seller['KPP'] ?? ''}',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                '(14)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(может не заполняться при проставлении печати в М.П., может быть указан ИНН / КПП)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 9 слева М.П.
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(421),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      defaultVerticalAlignment:
                                          pw.TableCellVerticalAlignment.middle,
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                'М.П.',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // ===== ПРАВАЯ КОЛОНКА (вложенные таблицы справа) =====
                              pw.Container(
                                padding:
                                    const pw.EdgeInsets.fromLTRB(10, 2, 2, 2),
                                child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    // Таблица 1 справа
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(421),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      defaultVerticalAlignment:
                                          pw.TableCellVerticalAlignment.middle,
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                'Товар (груз) получил / услуги, результаты работ, права',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 2 справа
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(120),
                                        1: pw.FixedColumnWidth(10),
                                        2: pw.FixedColumnWidth(120),
                                        3: pw.FixedColumnWidth(10),
                                        4: pw.FixedColumnWidth(120),
                                        5: pw.FixedColumnWidth(41),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            //Должность покупателя кто подписывает документ
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                clientSignerPosition,
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ', //ПОДПИСЬ
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            //Имя руководителя клиента
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                clientSignerName != null &&
                                                        clientSignerName
                                                            .toString()
                                                            .trim()
                                                            .isNotEmpty
                                                    ? clientSignerName
                                                    : (buyer['director_name'] ??
                                                        ' '),
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                '(15)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(должность)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(подпись)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(ф.и.о.)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 3 справа
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(170),
                                        1: pw.FixedColumnWidth(10),
                                        2: pw.FixedColumnWidth(130),
                                        3: pw.FixedColumnWidth(70),
                                        4: pw.FixedColumnWidth(41),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                'Дата получения (приемки)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                dateSigner, //Дата отгрузки
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                '(16)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 4 справа
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(421),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      defaultVerticalAlignment:
                                          pw.TableCellVerticalAlignment.middle,
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                'Иные сведения о получении, приемке',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 5 справа
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(380),
                                        1: pw.FixedColumnWidth(41),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                '(17)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(информация о наличии/отсутствии претензии; ссылки на неотъемлемые приложения, и другие документы и т.п.)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 6 справа
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(120),
                                        1: pw.FixedColumnWidth(10),
                                        2: pw.FixedColumnWidth(120),
                                        3: pw.FixedColumnWidth(10),
                                        4: pw.FixedColumnWidth(120),
                                        5: pw.FixedColumnWidth(41),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            //Должность покупателя кто подписывает документ
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                clientSignerPosition,
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ', //ПОДПИСЬ
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            //Имя руководителя клиента
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                clientSignerName != null &&
                                                        clientSignerName
                                                            .toString()
                                                            .trim()
                                                            .isNotEmpty
                                                    ? clientSignerName
                                                    : (buyer['director_name'] ??
                                                        ' '),
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                '(18)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(должность)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(подпись)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(ф.и.о.)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 7 справа
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(421),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      defaultVerticalAlignment:
                                          pw.TableCellVerticalAlignment.middle,
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(0),
                                              child: pw.Text(
                                                ' Наименование экономического субъекта – составителя документа',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 8 справа
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(380),
                                        1: pw.FixedColumnWidth(41),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                '${buyer['name_company'] ?? ''} '
                                                'ИНН: ${buyer['INN'] ?? ''}  КПП: ${buyer['KPP'] ?? ''}',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              child: pw.Text(
                                                '(19)',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              alignment: pw.Alignment.center,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  top: pw.BorderSide(
                                                    color: PdfColors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: pw.Text(
                                                '(может не заполняться при проставлении печати в М.П., может быть указан ИНН / КПП)',
                                                style:
                                                    pw.TextStyle(fontSize: 6),
                                              ),
                                            ),
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                ' ',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Таблица 9 справа М.П.
                                    pw.Table(
                                      columnWidths: const {
                                        0: pw.FixedColumnWidth(421),
                                      },
                                      border: pw.TableBorder(
                                        top: pw.BorderSide.none,
                                        bottom: pw.BorderSide.none,
                                        left: pw.BorderSide.none,
                                        right: pw.BorderSide.none,
                                        verticalInside: pw.BorderSide.none,
                                        horizontalInside: pw.BorderSide.none,
                                      ),
                                      defaultVerticalAlignment:
                                          pw.TableCellVerticalAlignment.middle,
                                      children: [
                                        pw.TableRow(
                                          children: [
                                            pw.Container(
                                              padding:
                                                  const pw.EdgeInsets.all(2),
                                              child: pw.Text(
                                                'М.П.',
                                                style:
                                                    pw.TextStyle(fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  final bytes = await pdf.save();
  final supabase = SupaFlow.client;
  final fileName = 'upd_${DateTime.now().millisecondsSinceEpoch}.pdf';
  final path = folder.isNotEmpty ? '$folder/$fileName' : fileName;

  await supabase.storage.from(bucket).uploadBinary(path, bytes);
  final publicUrl = supabase.storage.from(bucket).getPublicUrl(path);
  return publicUrl;
}
