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

import 'dart:convert';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

// ============================================================================
// Транслитерация кириллицы -> латиница (для имени файла в Supabase Storage)
// ============================================================================
String _translitRuToEn(String input) {
  const map = {
    'а': 'a',
    'б': 'b',
    'в': 'v',
    'г': 'g',
    'д': 'd',
    'е': 'e',
    'ё': 'e',
    'ж': 'zh',
    'з': 'z',
    'и': 'i',
    'й': 'y',
    'к': 'k',
    'л': 'l',
    'м': 'm',
    'н': 'n',
    'о': 'o',
    'п': 'p',
    'р': 'r',
    'с': 's',
    'т': 't',
    'у': 'u',
    'ф': 'f',
    'х': 'h',
    'ц': 'ts',
    'ч': 'ch',
    'ш': 'sh',
    'щ': 'sch',
    'ъ': '',
    'ы': 'y',
    'ь': '',
    'э': 'e',
    'ю': 'yu',
    'я': 'ya',
  };
  final sb = StringBuffer();
  for (final rune in input.runes) {
    final ch = String.fromCharCode(rune);
    final lower = ch.toLowerCase();
    if (map.containsKey(lower)) {
      final t = map[lower]!;
      if (ch != lower && t.isNotEmpty) {
        sb.write(t[0].toUpperCase() + t.substring(1));
      } else {
        sb.write(t);
      }
    } else {
      sb.write(ch);
    }
  }
  return sb.toString();
}

// ============================================================================
// Приведение имени файла к безопасному виду для Supabase Storage
// ============================================================================
String sanitizeFileNameForStorage(String raw) {
  var s = raw.trim();
  s = s.replaceAll('№', 'No');
  s = _translitRuToEn(s);
  s = s.replaceAll(RegExp(r'\s+'), '_');
  s = s.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
  s = s.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
  s = s.replaceAll(RegExp(r'_+'), '_');
  s = s.replaceAll(RegExp(r'[_\.]+$'), '');
  return s;
}

// ============================================================================
// Вспомогательное: чистим "невидимые" символы
// ============================================================================
String cleanPdfText(String text) {
  return text.replaceAll('\r', '').replaceAll('\u00A0', ' ').trimRight();
}

// ============================================================================
// Шрифты Times New Roman (CYR) из Supabase
// ============================================================================
Future<Map<String, pw.Font>> loadPdfFonts() async {
  const baseUrl =
      'https://supabase.t-logo.ru/storage/v1/object/public/fonts/times_new_roman_cyr';
  final urls = {
    'regular': '$baseUrl/timesnrcyrmt.ttf',
    'bold': '$baseUrl/timesnrcyrmt_bold.ttf',
    'italic': '$baseUrl/timesnrcyrmt_inclined.ttf',
    'boldItalic': '$baseUrl/timesnrcyrmt_bold.ttf',
  };
  final fonts = <String, pw.Font>{};
  for (final e in urls.entries) {
    final resp = await http.get(Uri.parse(e.value));
    if (resp.statusCode != 200) {
      throw Exception(
          'Не удалось загрузить шрифт ${e.key}: ${resp.statusCode}');
    }
    fonts[e.key] = pw.Font.ttf(resp.bodyBytes.buffer.asByteData());
  }
  return fonts;
}

// ============================================================================
// ГЛАВНАЯ ФУНКЦИЯ (Параметры сохранены как были)
// ============================================================================
Future<String> generateAndUploadContractPdfCarrier(
  int contractDataId,
  String bucket,
  bool publicUrl,
  List<ContractClausesRow> listContractClauses,
  String customFileName,
  int idCustomerCompany,
  int idExecuterCompany,
  // >>> ПАРАМЕТРЫ ОСТАВЛЕНЫ (чтобы ничего не сломать) <<<
  bool includeExecutorSignStamp,
  bool includeCustomerSignStamp,
  bool forCarrier,
  bool forWarehouse,
) async {
  final supabase = SupaFlow.client;

  // ===========================================================================
  // 1) Берём данные договора (client_contract_data)
  // ===========================================================================
  final cd = await supabase
      .from('client_contract_data')
      .select()
      .eq('id', contractDataId)
      .single();
  final templateId = cd['template_id'] as String;
  final companyId = cd['company_id'] as int;
  final version = cd['version'] as int;
  final customerCompanyId = cd['customer_company_id'];
  final executorCompanyId = cd['executor_company_id'];

  // ===========================================================================
  // 2) Собираем vars для подстановки {{ключ}}
  // ===========================================================================
  String s(dynamic v) => (v ?? '').toString();
  final vars = <String, String>{};
  void mergeJson(dynamic json, {Map<String, dynamic>? rowForListLookup}) {
    if (json == null) return;
    dynamic parsed = json;
    if (json is String) {
      final trimmed = json.trim();
      if (trimmed.isEmpty) return;
      try {
        parsed = jsonDecode(trimmed);
      } catch (e) {
        print('mergeJson: ошибка парсинга JSON: $e');
        return;
      }
    }
    if (parsed is Map) {
      parsed.forEach((k, v) {
        final key = k.toString().trim();
        final value = s(v);
        if (key.isEmpty) return;
        vars[key] = value;
        vars[key.toLowerCase()] = value;
        vars[key.toUpperCase()] = value;
      });
      return;
    }
    if (parsed is List) {
      for (final k in parsed) {
        final key = k.toString().trim();
        final fromRow =
            rowForListLookup != null && rowForListLookup.containsKey(key)
                ? rowForListLookup[key]
                : null;
        final value = s(fromRow);
        if (key.isEmpty) continue;
        vars[key] = value;
        vars[key.toLowerCase()] = value;
        vars[key.toUpperCase()] = value;
      }
      return;
    }
  }

  mergeJson(cd['vars_fixed'], rowForListLookup: cd as Map<String, dynamic>);
  mergeJson(cd['vars_custom']);

  // ===========================================================================
  // 3) Загружаем компании
  // ===========================================================================
  final executor = await supabase
      .from('company')
      .select()
      .eq('id', executorCompanyId)
      .single();
  final customer = (customerCompanyId == null)
      ? <String, dynamic>{}
      : await supabase
          .from('company')
          .select()
          .eq('id', customerCompanyId)
          .single();

  void addCompanyVars(String prefix, Map<String, dynamic> row) {
    row.forEach((k, v) {
      if (v == null) return;
      final key = '${prefix}_$k';
      final value = s(v);
      vars[key] = value;
      vars[key.toLowerCase()] = value;
      vars[key.toUpperCase()] = value;
    });
  }

  addCompanyVars('executor', executor);
  addCompanyVars('customer', customer);

  // ===========================================================================
  // 3.1) Склады компании
  // ===========================================================================
  final warehouses = await supabase
      .from('warehouse')
      .select('address')
      .eq('company_warehouse', companyId)
      .order('id');
  final warehouseAddresses = <String>[];
  for (final wh in warehouses) {
    final addr = (wh['address'] ?? '').toString().trim();
    if (addr.isNotEmpty) warehouseAddresses.add(addr);
  }
  final warehouseList = warehouseAddresses.isNotEmpty
      ? '\n${warehouseAddresses.map((addr) => '- $addr').join('\n')}'
      : '__________________________________________';
  vars['warehouse_address'] = warehouseList;
  vars['WAREHOUSE_ADDRESS'] = warehouseList;
  vars['warehouse_address'.toLowerCase()] = warehouseList;

  // ===========================================================================
  // 4) Подстановка {{key}} -> value
  // ===========================================================================
  String applyVars(String text) {
    final re = RegExp(r'{{\s*([^}]+?)\s*}}');
    return text.replaceAllMapped(re, (m) {
      final keyRaw = (m.group(1) ?? '').trim();
      if (keyRaw.isEmpty) return m.group(0) ?? '';
      String? val = vars[keyRaw];
      val ??= vars[keyRaw.toLowerCase()];
      val ??= vars[keyRaw.toUpperCase()];
      if (val == null && keyRaw.contains('_')) {
        final i = keyRaw.indexOf('_');
        final prefix = keyRaw.substring(0, i);
        final suffix = keyRaw.substring(i + 1);
        val ??= vars['${prefix}_${suffix.toLowerCase()}'];
        val ??= vars['${prefix}_${suffix.toUpperCase()}'];
      }
      return val ?? (m.group(0) ?? '');
    });
  }

  // ===========================================================================
  // 5) PDF: поля страницы + шрифты/тема
  // ===========================================================================
  const double marginLeft = 32;
  const double marginRight = 32;
  const double marginTop = 32;
  const double marginBottom = 32;
  final fonts = await loadPdfFonts();
  final theme = pw.ThemeData.withFont(
    base: fonts['regular']!,
    bold: fonts['bold']!,
    italic: fonts['italic']!,
    boldItalic: fonts['boldItalic']!,
  );

  // ===========================================================================
  // 6) Форматирование пунктов
  // ===========================================================================
  pw.TextAlign mapAlign(int? align) {
    switch (align) {
      case 2:
        return pw.TextAlign.center;
      case 3:
        return pw.TextAlign.right;
      case 1:
      default:
        return pw.TextAlign.left;
    }
  }

  pw.TextStyle mapStyle(int? styleCode, {required double fontSize}) {
    final code = (styleCode ?? 0).toString();
    final bold = code.contains('1');
    final italic = code.contains('2');
    final underline = code.contains('3');
    pw.Font font = fonts['regular']!;
    if (bold && italic) {
      font = fonts['boldItalic']!;
    } else if (bold) {
      font = fonts['bold']!;
    } else if (italic) {
      font = fonts['italic']!;
    }
    return pw.TextStyle(
      font: font,
      fontSize: fontSize,
      decoration:
          underline ? pw.TextDecoration.underline : pw.TextDecoration.none,
    );
  }

  // ===========================================================================
  // 7) Собираем пункты договора
  // ===========================================================================
  final paragraphWidgets = <pw.Widget>[];
  if (listContractClauses.isEmpty) {
    paragraphWidgets.add(
      pw.Padding(
        padding: const pw.EdgeInsets.only(bottom: 8),
        child: pw.Container(
          width: double.infinity,
          child: pw.Text(
            'Пункты договора не переданы (listContractClauses пустой).',
            style: pw.TextStyle(font: fonts['regular']!, fontSize: 12),
          ),
        ),
      ),
    );
  } else {
    final sorted = [...listContractClauses];
    sorted.sort((a, b) {
      final ao = a.getField<int>('sort_order') ?? 0;
      final bo = b.getField<int>('sort_order') ?? 0;
      if (ao != bo) return ao.compareTo(bo);
      final aid = a.getField<int>('id') ?? 0;
      final bid = b.getField<int>('id') ?? 0;
      return aid.compareTo(bid);
    });
    for (final row in sorted) {
      final enabled = row.getField<bool>('enabled') ?? true;
      if (!enabled) continue;
      final rawText = row.getField<String>('text') ?? '';
      final rendered = cleanPdfText(applyVars(rawText));
      if (rendered.trim().isEmpty) continue;
      final fontSize = (row.getField<int>('font_size') ?? 11).toDouble();
      final align = row.getField<int>('text_align') ?? 1;
      final styleCode = row.getField<int>('style_code') ?? 0;
      paragraphWidgets.add(
        pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 8),
          child: pw.Container(
            width: double.infinity,
            child: pw.Text(
              rendered,
              textAlign: mapAlign(align),
              style: mapStyle(styleCode, fontSize: fontSize),
            ),
          ),
        ),
      );
    }
    if (paragraphWidgets.isEmpty) {
      paragraphWidgets.add(
        pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 8),
          child: pw.Container(
            width: double.infinity,
            child: pw.Text(
              'Пункты договора отфильтрованы (все disabled или пустой text).',
              style: pw.TextStyle(font: fonts['regular']!, fontSize: 12),
            ),
          ),
        ),
      );
    }
  }

  // ===========================================================================
  // 8) Загрузка изображений подписей и печатей
  // ===========================================================================
  Future<Uint8List?> loadBytesFromUrl(String url) async {
    final u = url.trim();
    if (u.isEmpty) return null;
    final r = await http.get(Uri.parse(u));
    if (r.statusCode >= 200 && r.statusCode < 300) {
      return r.bodyBytes;
    }
    return null;
  }

  String pickUrl(
      String? fromVars, Map<String, dynamic> companyRow, String key) {
    final v = (fromVars ?? '').trim();
    if (v.isNotEmpty) return v;
    return (companyRow[key] ?? '').toString().trim();
  }

  final sellerSignatureUrl =
      pickUrl(vars['executor_signature_url'], executor, 'signature_url');
  final buyerSignatureUrl =
      pickUrl(vars['customer_signature_url'], customer, 'signature_url');
  final sellerStampUrl =
      pickUrl(vars['executor_stamp_url'], executor, 'stamp_url');
  final buyerStampUrl =
      pickUrl(vars['customer_stamp_url'], customer, 'stamp_url');

  final Uint8List? sellerSignatureBytes =
      await loadBytesFromUrl(sellerSignatureUrl);
  final Uint8List? buyerSignatureBytes =
      await loadBytesFromUrl(buyerSignatureUrl);
  final Uint8List? sellerStampBytes = await loadBytesFromUrl(sellerStampUrl);
  final Uint8List? buyerStampBytes = await loadBytesFromUrl(buyerStampUrl);

  final sellerDirector =
      (vars['executor_director_name']?.trim().isNotEmpty ?? false)
          ? vars['executor_director_name']!.trim()
          : (executor['director_name'] ?? '').toString();
  final buyerDirector =
      (vars['customer_director_name']?.trim().isNotEmpty ?? false)
          ? vars['customer_director_name']!.trim()
          : (customer['director_name'] ?? '').toString();

  // ===========================================================================
  // 8.5) ТЕКСТ РЕКВИЗИТОВ СТОРОН
  // ===========================================================================
  String v(String key) => (vars[key] ?? '').toString().trim();
  String buildReqText(String prefix, String title) {
    final lines = <String>[];
    void add(String text) {
      if (text.trim().isNotEmpty) lines.add(text);
    }

    void addKV(String label, String key, {bool colon = true}) {
      final val = v(key);
      if (val.isEmpty) return;
      add(colon ? '$label: $val' : '$label $val');
    }

    add(title);
    final type = v('${prefix}_type');
    final name = v('${prefix}_name_company');
    final nameLine = [type, name].where((e) => e.isNotEmpty).join(' ');
    if (nameLine.isNotEmpty) add(nameLine);
    addKV('Юридический адрес', '${prefix}_R_ur_address');
    addKV('Фактический адрес', '${prefix}_R_fact_address');
    addKV('ИНН', '${prefix}_INN', colon: false);
    addKV('КПП', '${prefix}_KPP', colon: false);
    addKV('ОГРН', '${prefix}_OGRN', colon: false);
    addKV('Р/с', '${prefix}_payment_account', colon: false);
    final bank = v('${prefix}_nname_bank');
    if (bank.isNotEmpty) add('Банк: $bank');
    addKV('К/с', '${prefix}_correspondent_account', colon: false);
    addKV('БИК', '${prefix}_BIK', colon: false);
    final dir = v('${prefix}_director_name');
    if (dir.isNotEmpty) add('Директор $dir');
    addKV('тел. (факс)', '${prefix}_phone');
    addKV('e-mail', '${prefix}_email');
    return cleanPdfText(lines.join('\n'));
  }

  final String executorReqText = buildReqText('executor', 'Исполнитель:');
  final String customerReqText = buildReqText('customer', 'Заказчик:');

  // ===========================================================================
  // 9) Реквизиты и подписи сторон (С УЧЕТОМ ФЛАГОВ)
  // ===========================================================================
  paragraphWidgets.add(
    pw.Padding(
      padding: const pw.EdgeInsets.only(top: 12),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Реквизиты и подписи сторон',
            style: pw.TextStyle(font: fonts['bold']!, fontSize: 14),
          ),
          pw.SizedBox(height: 8),
          pw.Table(
            border: pw.TableBorder(
              top: const pw.BorderSide(width: 0.8, color: PdfColors.black),
              bottom: const pw.BorderSide(width: 0.8, color: PdfColors.black),
              left: const pw.BorderSide(width: 0.8, color: PdfColors.black),
              right: const pw.BorderSide(width: 0.8, color: PdfColors.black),
              verticalInside:
                  const pw.BorderSide(width: 0.8, color: PdfColors.black),
              horizontalInside: pw.BorderSide.none,
            ),
            columnWidths: const {
              0: pw.FlexColumnWidth(1),
              1: pw.FlexColumnWidth(1),
            },
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(12),
                    child: pw.ConstrainedBox(
                      constraints: const pw.BoxConstraints(minHeight: 120),
                      child: pw.Text(cleanPdfText(executorReqText),
                          style: pw.TextStyle(
                              font: fonts['regular']!, fontSize: 12)),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(12),
                    child: pw.ConstrainedBox(
                      constraints: const pw.BoxConstraints(minHeight: 120),
                      child: pw.Text(cleanPdfText(customerReqText),
                          style: pw.TextStyle(
                              font: fonts['regular']!, fontSize: 12)),
                    ),
                  ),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(12),
                    child: pw.ConstrainedBox(
                      constraints: const pw.BoxConstraints(minHeight: 100),
                      child: pw.Stack(
                        children: [
                          if (includeExecutorSignStamp &&
                              sellerSignatureBytes != null)
                            pw.Padding(
                              padding:
                                  const pw.EdgeInsets.only(top: 1, left: 55),
                              child: pw.Image(
                                pw.MemoryImage(sellerSignatureBytes),
                                width: 85,
                                height: 25,
                              ),
                            ),
                          if (includeExecutorSignStamp &&
                              sellerStampBytes != null)
                            pw.Positioned(
                              left: 110,
                              bottom: 0,
                              child: pw.Image(pw.MemoryImage(sellerStampBytes),
                                  width: 90, height: 90),
                            ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(top: 14),
                            child: pw.Text(
                              cleanPdfText(
                                  'Подпись: ________/${sellerDirector.trim()}'),
                              style: pw.TextStyle(
                                  font: fonts['regular']!, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(12),
                    child: pw.ConstrainedBox(
                      constraints: const pw.BoxConstraints(minHeight: 100),
                      child: pw.Stack(
                        children: [
                          if (includeCustomerSignStamp &&
                              buyerSignatureBytes != null)
                            pw.Padding(
                              padding:
                                  const pw.EdgeInsets.only(top: 1, left: 55),
                              child: pw.Image(
                                pw.MemoryImage(buyerSignatureBytes),
                                width: 75,
                                height: 25,
                              ),
                            ),
                          if (includeCustomerSignStamp &&
                              buyerStampBytes != null)
                            pw.Positioned(
                              left: 110,
                              bottom: 0,
                              child: pw.Image(pw.MemoryImage(buyerStampBytes),
                                  width: 90, height: 90),
                            ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(top: 14),
                            child: pw.Text(
                              cleanPdfText(
                                  'Подпись: ________/${buyerDirector.trim()}'),
                              style: pw.TextStyle(
                                  font: fonts['regular']!, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );

  // ===========================================================================
  // 9.2) ПРИЛОЖЕНИЕ №1 и №2
  // ===========================================================================
  final contractNumber = (vars['contract_number'] ?? '').toString().trim();
  final contractDate = (vars['contract_date'] ?? '').toString().trim();
  const double borderW = 0.8;
  const double font11 = 11;
  const double font10 = 10;
  const double font9 = 9;
  const double font8 = 8;
  const double font7 = 7;

  String appendixHeaderLine(String appendixNo) {
    final n = contractNumber.isNotEmpty ? contractNumber : '___/___/___';
    final d = contractDate.isNotEmpty ? contractDate : '___.___. 202__';
    return 'Приложение № $appendixNo к договору № $n от $d';
  }

  pw.Widget lineBox({double w = 120, double h = 12}) {
    return pw.Container(
      width: w,
      height: h,
      decoration: pw.BoxDecoration(
        border: pw.Border(
            bottom: pw.BorderSide(width: borderW, color: PdfColors.black)),
      ),
    );
  }

  // ===========================================================================
  // СТРАНИЦА 1 — "Образец Заявка" (Приложение №1) — ПОЛНЫЙ КОД
  // ===========================================================================
  paragraphWidgets.add(pw.NewPage());
  paragraphWidgets.add(
    pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Align(
          alignment: pw.Alignment.topRight,
          child: pw.Text(appendixHeaderLine('1'),
              style: pw.TextStyle(font: fonts['regular']!, fontSize: font10)),
        ),
        pw.SizedBox(height: 10),
        pw.Text('Образец Заявка',
            style: pw.TextStyle(font: fonts['bold']!, fontSize: 12)),
        pw.SizedBox(height: 8),
        pw.Table(
          border: pw.TableBorder.all(width: borderW, color: PdfColors.black),
          children: [
            // СТРОКА 1
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(children: [
                        pw.Text(
                          'Заявка (акт) на выполнение Погрузо-разгрузочных работ №',
                          style: pw.TextStyle(
                              font: fonts['regular']!, fontSize: font10),
                        ),
                        lineBox(w: 35, h: 12),
                        pw.Text(' от «',
                            style: pw.TextStyle(
                                font: fonts['regular']!, fontSize: font10)),
                        lineBox(w: 30, h: 12),
                        pw.Text('»',
                            style: pw.TextStyle(
                                font: fonts['regular']!, fontSize: font10)),
                        lineBox(w: 30, h: 12),
                        pw.Text(' 202',
                            style: pw.TextStyle(
                                font: fonts['regular']!, fontSize: font10)),
                        lineBox(w: 30, h: 12),
                        pw.Text(' г.',
                            style: pw.TextStyle(
                                font: fonts['regular']!, fontSize: font10)),
                      ]),
                      pw.SizedBox(height: 6),
                      pw.Text(
                        'г. __________________ (город, в котором выполняется услуга ПРР)',
                        style: pw.TextStyle(
                            font: fonts['regular']!, fontSize: font10),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text('Номер машины _____________________',
                          style: pw.TextStyle(
                              font: fonts['regular']!, fontSize: font10)),
                      pw.SizedBox(height: 4),
                      pw.Text('Тел. Водителя: ______________________',
                          style: pw.TextStyle(
                              font: fonts['regular']!, fontSize: font10)),
                    ],
                  ),
                ),
              ],
            ),
            // СТРОКА 2
            pw.TableRow(
              children: [
                pw.Padding(
                  padding:
                      const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: pw.Text('Задание Заказчика:',
                      style: pw.TextStyle(
                          font: fonts['regular']!, fontSize: font10)),
                ),
              ],
            ),
            // СТРОКА 3
            pw.TableRow(
              children: [
                pw.Table(
                  border: pw.TableBorder.all(
                      width: borderW, color: PdfColors.black),
                  columnWidths: const {
                    0: pw.FlexColumnWidth(2.2),
                    1: pw.FlexColumnWidth(1.8),
                    2: pw.FlexColumnWidth(2.4),
                    3: pw.FlexColumnWidth(1.2),
                  },
                  children: [
                    pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(6),
                          child: pw.Text('Вид Погрузо-разгрузочных работ',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  font: fonts['regular']!, fontSize: font9)),
                        ),
                        pw.Table(
                          border: pw.TableBorder(
                            top: pw.BorderSide(
                                width: borderW, color: PdfColors.black),
                            left: pw.BorderSide(
                                width: borderW, color: PdfColors.black),
                            right: pw.BorderSide(
                                width: borderW, color: PdfColors.black),
                            bottom: pw.BorderSide(
                                width: borderW, color: PdfColors.white),
                          ),
                          children: [
                            pw.TableRow(
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    width: borderW, color: PdfColors.black),
                              ),
                              children: [
                                pw.Padding(
                                  padding: const pw.EdgeInsets.all(4),
                                  child: pw.Column(
                                    children: [
                                      pw.Text('Планируемый объем работ',
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                              font: fonts['regular']!,
                                              fontSize: font9)),
                                      pw.Text('(заполняется Заказчиком)',
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                              font: fonts['regular']!,
                                              fontSize: font9)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            pw.TableRow(
                              decoration: pw.BoxDecoration(
                                border: pw.Border(
                                  left: pw.BorderSide(
                                      width: borderW, color: PdfColors.black),
                                  right: pw.BorderSide(
                                      width: borderW, color: PdfColors.black),
                                  bottom: pw.BorderSide(
                                      width: borderW, color: PdfColors.white),
                                  top: pw.BorderSide(
                                      width: borderW, color: PdfColors.black),
                                ),
                              ),
                              children: [
                                pw.Padding(
                                  padding: const pw.EdgeInsets.all(4),
                                  child: pw.Column(
                                    children: [
                                      pw.Text('Количество',
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                              font: fonts['regular']!,
                                              fontSize: font8)),
                                      pw.Text('(место, паллет, шт, кор.)',
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                              font: fonts['regular']!,
                                              fontSize: font7)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        pw.Table(
                          border: pw.TableBorder.all(
                              width: borderW, color: PdfColors.black),
                          children: [
                            pw.TableRow(
                              children: [
                                pw.Padding(
                                  padding: const pw.EdgeInsets.all(4),
                                  child: pw.Column(
                                    children: [
                                      pw.Text('фактически выполнено',
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                              font: fonts['regular']!,
                                              fontSize: font9)),
                                      pw.Text('(заполняется Исполнителем)',
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                              font: fonts['regular']!,
                                              fontSize: font9)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            pw.TableRow(
                              children: [
                                pw.Table(
                                  border: pw.TableBorder(
                                    verticalInside: pw.BorderSide(
                                        width: borderW, color: PdfColors.black),
                                  ),
                                  columnWidths: const {
                                    0: pw.FlexColumnWidth(1),
                                    1: pw.FlexColumnWidth(1),
                                  },
                                  children: [
                                    pw.TableRow(
                                      children: [
                                        pw.Padding(
                                          padding: const pw.EdgeInsets.all(4),
                                          child: pw.Column(
                                            children: [
                                              pw.Text('количество',
                                                  textAlign:
                                                      pw.TextAlign.center,
                                                  style: pw.TextStyle(
                                                      font: fonts['regular']!,
                                                      fontSize: font8)),
                                              pw.Text('(место, паллет,',
                                                  textAlign:
                                                      pw.TextAlign.center,
                                                  style: pw.TextStyle(
                                                      font: fonts['regular']!,
                                                      fontSize: font7)),
                                              pw.Text('шт, кор.)',
                                                  textAlign:
                                                      pw.TextAlign.center,
                                                  style: pw.TextStyle(
                                                      font: fonts['regular']!,
                                                      fontSize: font7)),
                                            ],
                                          ),
                                        ),
                                        pw.Padding(
                                          padding: const pw.EdgeInsets.all(4),
                                          child: pw.Column(
                                            children: [
                                              pw.Text('стоимость',
                                                  textAlign:
                                                      pw.TextAlign.center,
                                                  style: pw.TextStyle(
                                                      font: fonts['regular']!,
                                                      fontSize: font8)),
                                              pw.Text('за единицу',
                                                  textAlign:
                                                      pw.TextAlign.center,
                                                  style: pw.TextStyle(
                                                      font: fonts['regular']!,
                                                      fontSize: font7)),
                                            ],
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
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(6),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text('Сумма',
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                      font: fonts['regular']!,
                                      fontSize: font9)),
                              pw.Text('(руб.)',
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                      font: fonts['regular']!,
                                      fontSize: font9)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // СТРОКА 4
            pw.TableRow(
              children: [
                pw.Table(
                  border: pw.TableBorder.all(
                      width: borderW, color: PdfColors.black),
                  columnWidths: const {
                    0: pw.FlexColumnWidth(2.2),
                    1: pw.FlexColumnWidth(1.8),
                    2: pw.FlexColumnWidth(1.2),
                    3: pw.FlexColumnWidth(1.2),
                    4: pw.FlexColumnWidth(1.2),
                  },
                  children: [
                    ...[
                      'Выгрузка механическая',
                      'Погрузка механическая',
                      'Выравнивание паллета с грузом',
                      'Формирование паллета',
                      'Паллетирование',
                      'Хранение паллета',
                    ].map((name) {
                      return pw.TableRow(
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                horizontal: 6, vertical: 8),
                            child: pw.Text(name,
                                style: pw.TextStyle(
                                    font: fonts['regular']!, fontSize: font9)),
                          ),
                          pw.Container(height: 18),
                          pw.Container(height: 18),
                          pw.Container(height: 18),
                          pw.Container(height: 18),
                        ],
                      );
                    }).toList(),
                    pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(6),
                          child: pw.Text('ИТОГО:',
                              style: pw.TextStyle(
                                  font: fonts['bold']!, fontSize: font9)),
                        ),
                        pw.Container(),
                        pw.Container(),
                        pw.Container(),
                        pw.Container(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // СТРОКА 5 — ПОДПИСИ (С УЧЕТОМ ФЛАГОВ)
            pw.TableRow(
              children: [
                pw.Table(
                  border: pw.TableBorder.all(
                      width: borderW, color: PdfColors.black),
                  columnWidths: const {
                    0: pw.FlexColumnWidth(4),
                    1: pw.FlexColumnWidth(3.6),
                  },
                  children: [
                    pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Заявку сформировал Заказчик:',
                                  style: pw.TextStyle(
                                      font: fonts['regular']!,
                                      fontSize: font9)),
                              pw.SizedBox(height: 10),
                              lineBox(w: 160, h: 12),
                              pw.SizedBox(height: 2),
                              pw.Text('(подпись/расшифровка ФИО)',
                                  style: pw.TextStyle(
                                      font: fonts['regular']!,
                                      fontSize: font7)),
                              pw.SizedBox(height: 4),
                              if (includeCustomerSignStamp)
                                pw.Text('м.п.',
                                    style: pw.TextStyle(
                                        font: fonts['regular']!,
                                        fontSize: font8)),
                            ],
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Стороны согласовали объем фактически',
                                  style: pw.TextStyle(
                                      font: fonts['regular']!,
                                      fontSize: font9)),
                              pw.Text('выполненных работ:',
                                  style: pw.TextStyle(
                                      font: fonts['regular']!,
                                      fontSize: font9)),
                              pw.SizedBox(height: 6),
                              if (includeExecutorSignStamp) ...[
                                pw.Row(children: [
                                  pw.Text('Исполнитель: ',
                                      style: pw.TextStyle(
                                          font: fonts['regular']!,
                                          fontSize: font9)),
                                  lineBox(w: 50, h: 12),
                                  pw.Text(' / ',
                                      style: pw.TextStyle(
                                          font: fonts['regular']!,
                                          fontSize: font9)),
                                  lineBox(w: 60, h: 12),
                                ]),
                                pw.SizedBox(height: 2),
                                pw.Text('(подпись/расшифровка ФИО)',
                                    style: pw.TextStyle(
                                        font: fonts['regular']!,
                                        fontSize: font7)),
                                pw.SizedBox(height: 4),
                                pw.Text('м.п.',
                                    style: pw.TextStyle(
                                        font: fonts['regular']!,
                                        fontSize: font8)),
                                pw.SizedBox(height: 8),
                              ],
                              if (includeCustomerSignStamp) ...[
                                pw.Row(children: [
                                  pw.Text('Заказчик: ',
                                      style: pw.TextStyle(
                                          font: fonts['regular']!,
                                          fontSize: font9)),
                                  lineBox(w: 50, h: 12),
                                  pw.Text(' / ',
                                      style: pw.TextStyle(
                                          font: fonts['regular']!,
                                          fontSize: font9)),
                                  lineBox(w: 60, h: 12),
                                ]),
                                pw.SizedBox(height: 2),
                                pw.Text('(подпись/расшифровка ФИО)',
                                    style: pw.TextStyle(
                                        font: fonts['regular']!,
                                        fontSize: font7)),
                                pw.SizedBox(height: 4),
                                pw.Text('м.п.',
                                    style: pw.TextStyle(
                                        font: fonts['regular']!,
                                        fontSize: font8)),
                              ],
                            ],
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
        pw.SizedBox(height: 8),
        pw.Text('Форма согласованна.',
            style: pw.TextStyle(font: fonts['regular']!, fontSize: font10)),
      ],
    ),
  );

  // ===========================================================================
  // СТРАНИЦА 2 — "Стоимость оказанных услуг" (Приложение №2)
  // ===========================================================================
  paragraphWidgets.add(pw.NewPage());
  paragraphWidgets.add(
    pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Align(
          alignment: pw.Alignment.topRight,
          child: pw.Text(appendixHeaderLine('2'),
              style: pw.TextStyle(font: fonts['regular']!, fontSize: font10)),
        ),
        pw.SizedBox(height: 20),
        pw.Align(
          alignment: pw.Alignment.topCenter,
          child: pw.Text('Стоимость оказанных услуг',
              style: pw.TextStyle(font: fonts['regular']!, fontSize: font11)),
        ),
        pw.SizedBox(height: 12),
        pw.Align(
          alignment: pw.Alignment.topCenter,
          child: pw.SizedBox(
            width: 480,
            child: pw.Table(
              border:
                  pw.TableBorder.all(width: borderW, color: PdfColors.black),
              columnWidths: const {
                0: pw.FlexColumnWidth(3.0),
                1: pw.FlexColumnWidth(2.0),
              },
              children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(6),
                      child: pw.Text('Наименование',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              font: fonts['regular']!, fontSize: font10)),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(6),
                      child: pw.Text('Стоимость (руб., без НДС)',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              font: fonts['regular']!, fontSize: font10)),
                    ),
                  ],
                ),
                ...[
                  ['Выгрузка механическая', 'руб./паллет'],
                  ['Погрузка механическая', 'руб./паллет'],
                  [
                    'Формирование паллета (ручная комплектация + стрейч пленка )',
                    'руб./паллет'
                  ],
                  ['Паллетирование стрейч пленкой', 'руб./паллет'],
                  ['Поправить паллет', 'руб./паллет'],
                  ['Ручное формирование паллета', 'руб./место'],
                  ['Ответственное хранение (-18С)', 'руб./паллет/сутки'],
                  ['Ответственное хранение (+2С+4С)', 'руб./паллет/сутки'],
                ].map((row) {
                  return pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(6),
                        child: pw.Text(row[0],
                            style: pw.TextStyle(
                                font: fonts['regular']!, fontSize: font9)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(6),
                        child: pw.Text(row[1],
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                font: fonts['regular']!, fontSize: font9)),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  // ===========================================================================
  // 10) Footer (С УЧЕТОМ ФЛАГОВ)
  // ===========================================================================
  pw.Widget footerBuilder(pw.Context context) {
    pw.Widget cell({
      required pw.Widget top,
      required pw.Widget bottom,
    }) {
      return pw.Expanded(
        child: pw.Container(
          padding: const pw.EdgeInsets.only(right: 10),
          child: pw.Stack(
            children: [
              pw.Positioned(left: 0, top: 20, child: bottom),
              pw.Positioned(left: 0, top: 0, child: top),
            ],
          ),
        ),
      );
    }

    return pw.Container(
      margin: const pw.EdgeInsets.only(top: 10),
      child: pw.SizedBox(
        height: 55,
        width: double.infinity,
        child: pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            cell(
              bottom: (includeExecutorSignStamp && sellerSignatureBytes != null)
                  ? pw.Image(pw.MemoryImage(sellerSignatureBytes),
                      width: 60, height: 25)
                  : pw.SizedBox(width: 60, height: 25),
              top: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Исполнитель:',
                      style:
                          pw.TextStyle(font: fonts['regular']!, fontSize: 11)),
                  pw.SizedBox(height: 25),
                  pw.ConstrainedBox(
                    constraints: const pw.BoxConstraints(maxWidth: 240),
                    child: pw.Text(
                      '_________/ $sellerDirector',
                      style:
                          pw.TextStyle(font: fonts['regular']!, fontSize: 10),
                      maxLines: 1,
                      overflow: pw.TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(width: 250),
            cell(
              bottom: (includeCustomerSignStamp && buyerSignatureBytes != null)
                  ? pw.Image(pw.MemoryImage(buyerSignatureBytes),
                      width: 60, height: 25)
                  : pw.SizedBox(width: 60, height: 25),
              top: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Заказчик:',
                      style:
                          pw.TextStyle(font: fonts['regular']!, fontSize: 11)),
                  pw.SizedBox(height: 25),
                  pw.ConstrainedBox(
                    constraints: const pw.BoxConstraints(maxWidth: 240),
                    child: pw.Text(
                      '_________/ $buyerDirector',
                      style:
                          pw.TextStyle(font: fonts['regular']!, fontSize: 10),
                      maxLines: 1,
                      overflow: pw.TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // 11) PDF build
  // ===========================================================================
  final pdf = pw.Document();
  pdf.addPage(
    pw.MultiPage(
      theme: theme,
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(
          marginLeft, marginTop, marginRight, marginBottom),
      build: (context) => [
        pw.Directionality(
          textDirection: pw.TextDirection.ltr,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [...paragraphWidgets],
          ),
        ),
      ],
      footer: footerBuilder,
    ),
  );
  final bytes = await pdf.save();

  // ===========================================================================
  // 12) Upload в Storage
  // ===========================================================================
  final uuid = const Uuid().v4();
  final String displayName = (customFileName ?? '').trim().isNotEmpty
      ? customFileName!.trim()
      : 'Договор_${templateId}_v${version}_${contractDataId}';
  String safeBase = sanitizeFileNameForStorage(displayName);
  if (safeBase.isEmpty) {
    safeBase = 'contract_${templateId}_v${version}_${contractDataId}';
  }
  if (safeBase.toLowerCase().endsWith('.pdf')) {
    safeBase = safeBase.substring(0, safeBase.length - 4);
  }
  final String storageFileName = '${safeBase}__${uuid}.pdf';
  final String path = 'company_$companyId/$storageFileName';
  await supabase.storage.from(bucket).uploadBinary(
        path,
        Uint8List.fromList(bytes),
        fileOptions:
            const FileOptions(contentType: 'application/pdf', upsert: false),
      );

  // ===========================================================================
  // 13) URL
  // ===========================================================================
  String url;
  if (publicUrl) {
    url = supabase.storage.from(bucket).getPublicUrl(path);
  } else {
    url = await supabase.storage
        .from(bucket)
        .createSignedUrl(path, 60 * 60 * 24 * 7);
  }

  // ===========================================================================
  // 14) Шаг с записью в базу УДАЛЕН (как и договаривались)
  // ===========================================================================

  return url;
}
