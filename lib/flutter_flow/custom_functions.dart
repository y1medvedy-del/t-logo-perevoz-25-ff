import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

/// Разделяем str1 на слова, удаляем пробелы и преобразуем их к нижнему
/// регистру
/// Преобразуем str2 к нижнему регистру
/// Если хотя бы одно слово не найдено, возвращаем false
bool? srt1ToStr2(
  String? str1,
  String? str2,
) {
  if (str1 == null || str2 == null) {
    return null;
  }

  // Разделяем str1 на слова, удаляем пробелы и преобразуем их к нижнему регистру
  List<String> str1List =
      str1.split('#').map((word) => word.trim().toLowerCase()).toList();

  // Преобразуем str2 к нижнему регистру
  String lowerStr2 = str2.toLowerCase();

  // Проверяем, есть ли все слова из str1List во str2
  for (String word in str1List) {
    if (!lowerStr2.contains(word)) {
      return false; // Если хотя бы одно слово не найдено, возвращаем false
    }
  }

  return true; // Если все слова найдены, возвращаем true
}

String? deletProbel(String? str) {
  // убирает из str все пробелы
  if (str == null) {
    return null;
  }
  return str.replaceAll(' ', '');
}

int? quantityService(
  String? str,
  List<WorksStruct>? zayavka,
) {
  // если str равен zayavka.name вернуть zayavka.quantity, если quantity не 0
  if (zayavka != null) {
    for (var service in zayavka) {
      if (service.nameService == str) {
        // Возвращаем значение только если quantity не равно 0
        if (service.quantity != 0) {
          return service.quantity;
        } else {
          return null; // Если quantity равно 0, возвращаем null
        }
      }
    }
  }

  return null; // Если не найдено совпадений или список пустой
}

int? itemService(
  String? str,
  List<WorksStruct>? zayvcaList,
) {
  // найти элемент в zayvcaList у которого zayvcaList.name=str и вернуть его индекс
  for (int i = 0; i < zayvcaList!.length; i++) {
    if (zayvcaList[i].nameService == str) {
      return i;
    }
  }
  return 0;
}

int? strToInt(String? str) {
  // str преобразовать в int если str пустая строка вернуть 0
  if (str == null || str.isEmpty) {
    return 0;
  } else {
    return int.tryParse(str);
  }
}

/// Функция проверяет количество цифр в номер и общее колличество символов в
/// строке
bool? chekPhone(String? phone) {
  if (phone == null || phone.isEmpty) return false;

  final maskRegex = RegExp(
    r'^\+7\s\(\d{3}\)\s\d{3}-\d{2}-\d{2}$',
  );

  final cleanNumber = phone.replaceAll(RegExp(r'[^\d+]'), '');

  return phone.length == 18; // Проверка длины строки
}

DateTime? dateEndCalendar(int? sazeDay) {
  // прибавить к сегодняшнему дню sazeDay
  final now = DateTime.now();
  if (sazeDay == null) return null;
  return now.add(Duration(days: sazeDay));
}

double? conteinerScail(
  int? x1,
  int? x2,
  int? namber,
) {
  // namber надо разделить на x2/x1
  if (x1 == null || x2 == null || namber == null || x2 == 0) {
    return null;
  }
  return namber * (x2 / x1);
}

int? searchItemJSON(
  List<dynamic>? json,
  String? str,
) {
  // Проверяем, что входные данные не равны null
  if (json == null || str == null) {
    return null;
  }

  // Проходим по каждому элементу массива json
  for (int i = 0; i < json.length; i++) {
    var item = json[i];

    // Проверяем, является ли элемент Map<String, dynamic> (JSON-объектом)
    if (item is Map<String, dynamic>) {
      // Проходим по всем ключам и значениям объекта
      for (var value in item.values) {
        // Ищем точное совпадение со строкой str
        if (value == str) {
          return i; // Возвращаем индекс элемента, если найдено совпадение
        }
      }
    }
  }

  return null; // Возвращаем null, если совпадение не найдено
}

List<double>? latLonToListStr(LatLng? latLon) {
  // первый координат lat положи в первый элемент массива а второй кординат lon положи во второй элемент массиав
  if (latLon != null) {
    return [latLon.latitude, latLon.longitude];
  } else {
    return null;
  }
}

int? countStrJson(
  List<dynamic>? jsonList,
  String? strstr,
) {
  // посчитать колличество элементов в jsonList которые совпадают с str
  int count = 0;
  if (jsonList == null || strstr == null) {
    return null;
  }
  for (var item in jsonList) {
    if (item.toString().contains(strstr)) {
      count++;
    }
  }
  return count;
}

List<dynamic>? deleteFromListJsonStr(
  List<dynamic>? jsonList,
  String? str,
) {
  // надо удалить все элементы массива где какойто из параметров json равен str
  jsonList?.removeWhere((json) {
    if (json is Map<String, dynamic>) {
      return json.containsValue(str);
    }
    return false;
  });
  return jsonList;
}

String? today(DateTime? dateTime) {
  // если дата ровна сегодняшнему дню вернуть "сегодня" если нет то вернуть дату dd.mm.yy
  if (dateTime == null) return null;
  final now = DateTime.now();
  if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day) {
    return 'сегодня';
  } else {
    final formatter = DateFormat('dd.MM.yy');
    return formatter.format(dateTime);
  }
}

String? time(DateTime? dataTime) {
  // вернуть только время в формате 24 часов
  if (dataTime == null) return null;
  final formatter = DateFormat('HH:mm');
  return formatter.format(dataTime);
}

bool? chekEmail(String? email) {
// Регулярное выражение для проверки формата email
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Проверка, соответствует ли строка формату email
  if (email == null || !emailRegex.hasMatch(email)) {
    return false; // Если строка не является email, вернуть false
  }

  return true; // Если строка является email, вернуть true
}

bool? noNULL(String? srt) {
  // Убираем все пробелы
  String trimmedString = srt?.replaceAll(' ', '') ?? '';

  // Проверяем на наличие "null" или "NULL"
  if (trimmedString.toLowerCase().contains('null')) {
    return false;
  }

  return true; // Если не найдено, возвращаем true
}

DateTime? strToDate(
  String? str,
  bool? endOfDay,
) {
  if (str == null) {
    return null;
  }
  try {
    final format = DateFormat('d.M.y');
    final date = format.parse(str);

    // Установка времени в зависимости от параметра endOfDay
    if (endOfDay == true) {
      return DateTime(date.year, date.month, date.day, 23, 59, 59);
    } else {
      return DateTime(date.year, date.month, date.day, 0, 0, 0);
    }
  } catch (e) {
    return null;
  }
}

List<String>? strListTOimageList(List<String>? strList) {
  if (strList == null || strList.isEmpty) {
    return null;
  }

  // Здесь предполагается, что strList уже содержит ссылки на изображения
  // и просто возвращаем этот список
  List<String> imageList = List<String>.from(strList);

  return imageList;
}

List<String>? strListTOvideoList(List<String>? strList) {
  if (strList == null || strList.isEmpty) {
    return null;
  }

  // Предполагается, что strList уже содержит корректные пути к видео
  List<String> videoList = List<String>.from(strList);

  return videoList;
}

/// если addOrRemove=true добавить элемент в массив если addOrRemove=false то
/// удалить элемент из массива в массиве не должно быть повторяющихся значений
List<int>? addOrRemoveItemID(
  List<int>? intList,
  int? int1,
  bool? addOrRemove,
) {
  // если addOrRemove=true добавить элемент в массив если addOrRemove=false то удалить элемент из массива в массиве не должно быть повторяющихся значений
  if (intList == null || int1 == null || addOrRemove == null) {
    return null;
  }

  if (addOrRemove) {
    if (!intList.contains(int1)) {
      intList.add(int1);
    }
  } else {
    intList.remove(int1);
  }

  return intList.toSet().toList();
}

int? itemIndexWork(
  List<WorkQuantityPriceStruct>? workList,
  String? str,
) {
  if (workList == null || str == null) return null;

  for (int i = 0; i < workList.length; i++) {
    if (workList[i].nameWork == str) {
      return i; // Возвращаем индекс, если совпадение найдено
    }
  }

  return null; // Если элемент не найден
}

int? sumWorkListAnswer(List<WorkQuantityPriceStruct>? workList) {
  if (workList == null) return null;

  int total = 0;

  for (var work in workList) {
    total += (work.quantity * work.price).toInt();
  }

  return total;
}

bool? answerChekItemWorkSTR(
  List<WorkQuantityPriceStruct>? workList,
  String? str,
) {
  if (workList == null || str == null) return false;

  for (var work in workList) {
    if (work.nameWork == str) {
      return true; // Возвращаем true, если элемент найден
    }
  }

  return false; // Возвращаем false, если совпадений нет
}

String? numberApplication(
  String abbriviature,
  DateTime data,
  String? idApplication,
) {
  // data преобразовать в строку dmY после все параметры соединить в одну строку abbriviature+idApplication+data
  if (abbriviature.isEmpty || idApplication == null) {
    return null;
  }

  String formattedDate = DateFormat('ddMMyy').format(data);
  return '$abbriviature$idApplication$formattedDate';
}

int? converterToNegativeNumber(int? summ) {
  // сделать из положительного числа отрицательное
  if (summ != null && summ > 0) {
    return -summ;
  }
  return null;
}

int? commissionApplication(
  int? summ,
  int? commission,
) {
  // посчитать колличество процентов commission от summ
  if (summ != null && commission != null) {
    double commissionPercentage = commission / 100;
    double commissionAmount = summ * commissionPercentage;
    return commissionAmount.round();
  } else {
    return null;
  }
}

double? intToDouble(int? amount) {
  // int преобразовать в в double
  if (amount != null) {
    return amount.toDouble();
  }
  return null;
}

bool? filterDate1Date2(
  DateTime? date1,
  DateTime? date2,
  DateTime dateObject,
) {
  // Устанавливаем date1 на начало дня, если она не null
  if (date1 != null) {
    date1 = DateTime(date1.year, date1.month, date1.day);
  }

  // Если date2 пусто, устанавливаем его на конец дня date1
  if (date2 == null && date1 != null) {
    date2 = DateTime(date1.year, date1.month, date1.day, 23, 59, 59);
  }

  // Если date1 пусто, возвращаем true
  if (date1 == null) {
    return true;
  }

  int date1Int = date1.millisecondsSinceEpoch;
  int date2Int = date2 != null ? date2.millisecondsSinceEpoch : 0;
  int dateObjectInt = dateObject.millisecondsSinceEpoch;

  // Если date1 равно DateTime(0), возвращаем true
  if (date1Int == 0) {
    return true;
  }

  // Проверяем условия фильтрации
  if (date1Int <= dateObjectInt) {
    if (date2 == null || date2Int >= dateObjectInt) {
      return true; // Случай: date1 раньше или равен dateObject, и date2 пусто или позже
    }
  }

  // Все остальные случаи
  return false;
}

List<double>? geoToLadLonDouble(LatLng? geo) {
  // переведи latLng в два элемента duoble
  if (geo != null) {
    return [geo.latitude, geo.longitude];
  } else {
    return null;
  }
}

bool? fine24hour(
  DateTime? date1,
  DateTime? date2,
) {
  // если между двумя переменными разница больше 24 часо 00 минут вернуть true
  if (date1 == null || date2 == null) {
    return null;
  }

  Duration difference = date1.difference(date2).abs();
  if (difference.inHours > 24 ||
      (difference.inHours == 24 && difference.inMinutes > 0)) {
    return true;
  } else {
    return false;
  }
}

double? strToDuble(String? str) {
  // str to duble
  if (str == null) {
    return null;
  }
  try {
    return double.parse(str);
  } catch (e) {
    return null;
  }
}

double? distantionKM(
  double? lat1,
  double? lon1,
  double? lat2,
  double? lon2,
) {
  // Проверка на отсутствие координат
  if (lat1 == null || lon1 == null || lat2 == null || lon2 == null) {
    return null;
  }

  // Проверка нулевых значений координат
  if (lat1 == 0 || lon1 == 0 || lat2 == 0 || lon2 == 0) {
    return -1.0;
  }

  const double earthRadius = 6371000; // Радиус Земли в метрах

  // Преобразование в радианы
  final lat1Rad = lat1 * math.pi / 180;
  final lat2Rad = lat2 * math.pi / 180;

  // Вычисление разницы координат
  final deltaLat = (lat2 - lat1) * math.pi / 180;
  final deltaLon = (lon2 - lon1) * math.pi / 180;

  // Формула Хаверсина
  final a = math.sin(deltaLat / 2) * math.sin(deltaLat / 2) +
      math.cos(lat1Rad) *
          math.cos(lat2Rad) *
          math.sin(deltaLon / 2) *
          math.sin(deltaLon / 2);

  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  return (earthRadius * c / 1000).roundToDouble();
}

String? distantionStr(double? distance) {
  if (distance == null || distance < 0) {
    return null; // Возвращаем null для нулевых или отрицательных расстояний
  }

  final kilometers = distance.round();

  return '$kilometers км'; // Возвращаем километры без знаков после запятой
}

int? doubleToInt(double? doubl) {
  // переобразовать дабл в инт
  if (doubl != null) {
    return doubl.toInt();
  } else {
    return null;
  }
}

double? filterDistansionX1000(double? distantion) {
  // умнож на 1000
  if (distantion != null) {
    return distantion * 1000;
  }
  return null;
}

List<WorksStruct> worksListEdit(
  List<WorksStruct> worksList,
  String? nameWork,
  String? quantity,
  String? typeGruz,
) {
  // Проверяем, что список и имя работы не пустые
  if (nameWork == null || nameWork.isEmpty) {
    return worksList;
  }

  // Преобразуем quantity в целое число
  int? quantityValue = int.tryParse(quantity ?? '');

  // Ищем элемент в списке по имени работы
  int existingIndex =
      worksList.indexWhere((work) => work.nameService == nameWork);

  if (existingIndex != -1) {
    // Если элемент найден и quantity равно 0 или null — удаляем его
    if (quantityValue == null || quantityValue == 0) {
      worksList.removeAt(existingIndex);
    } else {
      // Иначе обновляем количество и typeGruz (если нужно)
      worksList[existingIndex] = WorksStruct(
        nameService: worksList[existingIndex].nameService,
        quantity: quantityValue,
        typeGruz: typeGruz ??
            worksList[existingIndex]
                .typeGruz, // Обновляем typeGruz, если передано новое значение
      );
    }
  } else {
    // Если элемент не найден и quantity больше нуля — добавляем новый элемент с typeGruz
    if (quantityValue != null && quantityValue > 0) {
      worksList.add(WorksStruct(
        nameService: nameWork,
        quantity: quantityValue,
        typeGruz: typeGruz, // Заполняем поле typeGruz для нового элемента
      ));
    }
  }

  return worksList;
}

String? upperCase(String? str) {
  if (str == null || str.isEmpty) {
    return null; // Если строка пустая или null, возвращаем null
  }

  // Словарь для замены латинских букв на кириллические
  final Map<String, String> latinToCyrillic = {
    'A': 'А',
    'B': 'В',
    'E': 'Е',
    'K': 'К',
    'M': 'М',
    'H': 'Н',
    'O': 'О',
    'P': 'Р',
    'C': 'С',
    'T': 'Т',
    'Y': 'У',
    'X': 'Х',
  };

  // Удаляем пробелы, преобразуем в верхний регистр
  String result = str.replaceAll(' ', '').toUpperCase();

  // Заменяем латинские буквы на кириллические
  latinToCyrillic.forEach((latin, cyrillic) {
    result = result.replaceAll(latin, cyrillic);
  });

  return result;
}

bool? registrationNumberChek(String? str) {
  if (str == null || str.isEmpty) {
    return false; // Если строка пустая или null, возвращаем false
  }

  // Удаляем все пробелы из строки
  final cleanedStr = str.replaceAll(' ', '');

  // Регулярное выражение для проверки российского номера (без учета регистра)
  final regExp = RegExp(
    r'^[АВЕКМНОРСТУХ]{1}\d{3}[АВЕКМНОРСТУХ]{2}\d{2,3}$',
    caseSensitive: false, // Игнорируем регистр
  );

  // Проверяем соответствие очищенной строки регулярному выражению
  return regExp.hasMatch(cleanedStr);
}

List<AplicationLocalStruct>? addApllicationLocal(
  List<AplicationLocalStruct>? applicationLocalList,
  AplicationLocalStruct? aplicationLocal,
) {
// Проверяем, что список не равен null
  if (applicationLocalList == null) {
    // Если список пустой, создаем новый список с одним элементом
    return aplicationLocal != null ? [aplicationLocal] : null;
  }

  // Создаем копию списка и добавляем новый элемент
  List<AplicationLocalStruct> newList = List.from(applicationLocalList);

  if (aplicationLocal != null) {
    newList.add(aplicationLocal);
  }

  // Возвращаем новый список
  return newList;
}

String? dateToStr(DateTime? date) {
  // нужно преобразовать дату в строку в формате 01.01.25
  if (date != null) {
    final formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(date);
  }
  return null;
}

List<String>? listPhotoToListStr(List<String>? listPhoto) {
  // Нужно преобразовать массив ссылок на изображение в массив строк
  if (listPhoto == null) {
    return null;
  }

  List<String> listStr = listPhoto.map((photo) => photo.toString()).toList();
  return listStr;
}

List<String>? videoListToStrList(List<String>? videoList) {
  // преобразуй массив ссылок на видео в массив ссылок строк
  if (videoList == null) {
    return null;
  }

  List<String> strList = videoList.map((video) => video.toString()).toList();
  return strList;
}

String? videoPathToStr(String? imagePath) {
  // преобразовать ссылку на видео в обычную ссылку
  if (imagePath != null && imagePath.startsWith('https://www.youtube.com/')) {
    return 'https://www.youtube.com/';
  } else {
    return imagePath;
  }
}

String? strToImagePath(String? referensImage) {
  // преобразовать строку в ссылку на изображение
  if (referensImage != null && referensImage.isNotEmpty) {
    return referensImage;
  } else {
    return null;
  }
}

String? strToReferensVideo(String? referensFile) {
  // преобразуй string в videoPath
  if (referensFile == null || referensFile.isEmpty) {
    return null;
  }

  // Convert the string to a video path
  String videoPath = referensFile;

  return videoPath;
}

String? quantituEstimation(int? estimation) {
  /// Проверка на null и отрицательное значение
  if (estimation == null || estimation < 0) return null;

  /// Логика для правильного склонения слова "оценка"
  int lastDigit = estimation % 10;
  int lastTwoDigits = estimation % 100;

  if (lastTwoDigits >= 11 && lastTwoDigits <= 14) {
    return '$estimation оценок';
  }

  if (lastDigit == 1) {
    return '$estimation оценка';
  } else if (lastDigit >= 2 && lastDigit <= 4) {
    return '$estimation оценки';
  } else {
    return '$estimation оценок';
  }
}

String? formatCarNumber(String? str) {
  if (str == null || str.isEmpty) return null;

  // Карта замены кириллических символов на латиницу
  final Map<String, String> translitMap = {
    'А': 'A',
    'В': 'B',
    'Е': 'E',
    'К': 'K',
    'М': 'M',
    'Н': 'H',
    'О': 'O',
    'Р': 'P',
    'С': 'C',
    'Т': 'T',
    'У': 'Y',
    'Х': 'X'
  };

  // Приводим к верхнему регистру и удаляем пробелы
  String formatted = str.toUpperCase().replaceAll(RegExp(r'\s+'), '');

  // Заменяем кириллические буквы на латиницу
  formatted =
      formatted.split('').map((char) => translitMap[char] ?? char).join('');

  return formatted;
}

LatLng? latLong(
  double? latt,
  String? lonn,
) {
  /// Проверяем, что значения не null
  if (latt == null || lonn == null) {
    return null;
  }

  /// Преобразуем долготу из String в double
  double? lonValue = double.tryParse(lonn);

  /// Проверяем, что преобразование прошло успешно
  if (lonValue == null) {
    return null;
  }

  /// Возвращаем LatLng
  return LatLng(latt, lonValue);
}

List<dynamic>? removeStreetDuplicates(List<dynamic>? jsonList) {
  if (jsonList == null) return null;

  final seen = <String>{};
  return jsonList.where((item) {
    final streetId = item['data']['street_fias_id']; // Проверяем ID улицы

    // Пропускаем, если street_fias_id == null или пустая строка
    if (streetId == null || streetId.isEmpty) {
      return false;
    }

    // Пропускаем дубликаты
    if (seen.contains(streetId)) {
      return false;
    }

    seen.add(streetId);
    return true;
  }).toList();
}

List<dynamic>? removeHouseDuplicates(List<dynamic>? jsonList) {
  if (jsonList == null) return null;

  final seen = <String>{};
  return jsonList.where((item) {
    final houseId = item['data']['house_fias_id']; // Проверяем ID дома

    // Пропускаем, если house_fias_id == null или пустая строка
    if (houseId == null || houseId.isEmpty) {
      return false;
    }

    // Пропускаем дубликаты
    if (seen.contains(houseId)) {
      return false;
    }

    seen.add(houseId);
    return true;
  }).toList();
}

String? cpitalLetter(String str) {
  // Удаление пробела с начала строки
  str = str.trimLeft();

  // Преобразование первой буквы в заглавную
  return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
}

/// дата для сообщений в чате на главной
String? dateMassageChat(DateTime? date) {
  if (date == null) return null;

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final inputDate = DateTime(date.year, date.month, date.day);

  if (today == inputDate) {
    return DateFormat('HH:mm').format(date);
  } else {
    return DateFormat('dd.MM.yy').format(date);
  }
}

/// проверяет прошло ли нужное колличество дней с момента создания или
/// завершения заявки
bool? isLessThanTwoDays(
  DateTime? creationDate,
  String daysToCheck,
) {
  if (creationDate == null) {
    return true;
  }

  final int? days = int.tryParse(daysToCheck);
  if (days == null) {
    return true;
  }

  final difference = DateTime.now().difference(creationDate);
  return difference.inDays < days;
}

String? strToPhone(String? str) {
  if (str == null || str.isEmpty) return '';

  // Удаляем все нецифровые символы
  final digits = str.replaceAll(RegExp(r'[^\d]'), '');

  // Если ввод начинается с 8 и длина больше 1, заменяем 8 на 7
  String processed = digits;
  if (digits.startsWith('8') && digits.length > 1) {
    processed = '7' + digits.substring(1);
  }

  // Если номер начинается с 7 и длина больше 11, обрезаем до 11 цифр
  if (processed.startsWith('7') && processed.length > 11) {
    processed = processed.substring(0, 11);
  }
  // Если номер не начинается с 7 и длина больше 10, обрезаем до 10 цифр
  else if (!processed.startsWith('7') && processed.length > 10) {
    processed = processed.substring(0, 10);
  }

  // Форматируем по шаблону +7 (XXX) XXX-XX-XX
  if (processed.isEmpty) {
    return '';
  }
  // Если начинается с 7 и длина 1 символ
  else if (processed.startsWith('7') && processed.length == 1) {
    return '+7 (';
  }
  // Если начинается с 7 и длина от 2 до 4 (7 XXX)
  else if (processed.startsWith('7') && processed.length <= 4) {
    final part1 = processed.substring(1);
    return '+7 ($part1';
  }
  // Если начинается с 7 и длина от 5 до 7 (7 XXX) XXX
  else if (processed.startsWith('7') && processed.length <= 7) {
    final part1 = processed.substring(1, 4);
    final part2 = processed.substring(4);
    return '+7 ($part1) $part2';
  }
  // Если начинается с 7 и длина от 8 до 9 (7 XXX) XXX-XX
  else if (processed.startsWith('7') && processed.length <= 9) {
    final part1 = processed.substring(1, 4);
    final part2 = processed.substring(4, 7);
    final part3 = processed.substring(7);
    return '+7 ($part1) $part2-$part3';
  }
  // Если начинается с 7 и длина 10+ (7 XXX) XXX-XX-XX
  else if (processed.startsWith('7') && processed.length >= 10) {
    final part1 = processed.substring(1, 4);
    final part2 = processed.substring(4, 7);
    final part3 = processed.substring(7, 9);
    final part4 = processed.substring(9, 11);
    return '+7 ($part1) $part2-$part3-$part4';
  }
  // Если не начинается с 7, обрабатываем как обычный номер
  else if (processed.length <= 3) {
    return '+7 ($processed';
  } else if (processed.length <= 6) {
    final part1 = processed.substring(0, 3);
    final part2 = processed.substring(3);
    return '+7 ($part1) $part2';
  } else if (processed.length <= 8) {
    final part1 = processed.substring(0, 3);
    final part2 = processed.substring(3, 6);
    final part3 = processed.substring(6);
    return '+7 ($part1) $part2-$part3';
  } else {
    final part1 = processed.substring(0, 3);
    final part2 = processed.substring(3, 6);
    final part3 = processed.substring(6, 8);
    final part4 = processed.substring(8, 10);
    return '+7 ($part1) $part2-$part3-$part4';
  }
}

String? intToStr(int? number) {
  // преобразовать int в str
  return number?.toString();
}

/// Функция которая удаляет из строки вторую строку с точным совпадением
/// (использую для сохранения адреса без номера дома)
String? removeSubstring(
  String original,
  String toRemove,
) {
  return original.replaceAll(toRemove, '');
}

/// Поведение функции: Если date1 == null → вернёт true.
///
/// Если date2 == null → вернёт false. Если обе даты в один день → вернёт
/// false. Если в разные дни → вернёт true.
bool compareDates(
  DateTime? date1,
  DateTime? date2,
) {
  if (date1 == null) return true;
  if (date2 == null) return false;

  return date1.year != date2.year ||
      date1.month != date2.month ||
      date1.day != date2.day;
}

/// 🔄 Преобразует List<dynamic> (массив с Supabase)
/// ➡️ в List<AplicationLocalStruct> (т.е.
///
/// твои локальные заявки в AppState).
List<AplicationLocalStruct>? convertSupabaseToLocalDrafts(
    List<dynamic>? supabaseList) {
  if (supabaseList == null) return null;

  return supabaseList.map((item) {
    // Преобразуем declaredWorks в List<WorksStruct>
    final declaredWorksRaw = item['declaredWorks'];
    final works = declaredWorksRaw is List
        ? declaredWorksRaw
            .map((w) => WorksStruct(
                  idApplication: w['idApplication'] as int?,
                  idAnswer: w['idAnswer'] as int?,
                  nameService: w['nameService'] as String?,
                  quantity: w['quantity'] as int?,
                  uniteSize: w['uniteSize'] as String?,
                  price: w['price'] as int?,
                  newQuantity: w['newQuantity'] as int?,
                  newPrice: w['newPrice'] as int?,
                  typeGruz: w['typeGruz'] as String?,
                ))
            .toList()
        : null;

    return AplicationLocalStruct(
      addressStreet: item['addressStreet'] as String?,
      addressHouse: item['addressHouse'] as String?,
      typeCargo: item['typeCargo'] as String?,
      desiretDate: item['desiretDate']?.toString(), // Сохраняем как String
      desiretTime: item['desiretTime'] as String?,
      description: item['description'] as String?,
      paymentType: item['paymentType'] as String?,
      declaredWorks: works,
      cityId: item['cityId'] as int?,
      cityName: item['cityName'] as String?,
      lat: (item['lat'] as num?)?.toDouble(),
      lon: (item['lon'] as num?)?.toDouble(),
      createDate: item['createDate'] != null
          ? DateTime.tryParse(
              item['createDate'].toString()) // String -> DateTime
          : null,
      creatinStage: item['creatinStage'] is int
          ? item['creatinStage'] as int? // Обрабатываем int
          : item['creatinStage'] != null
              ? int.tryParse(
                  item['creatinStage'].toString()) // Парсим из String
              : null,
      draft: item['draft'] as bool?,
      cityAbriviatyre: item['cityAbriviatyre'] as String?,
      photoList: (item['photoList'] as List<dynamic>?)?.cast<String>(),
      videoList: (item['videoList'] as List<dynamic>?)?.cast<String>(),
      phoneDriver: item['phoneDriver'] as String?,
      namberCar: item['namberCar']?.toString(), // Сохраняем как String
      nameCar: item['nameCar'] as String?,
      surnameDriver: item['surnameDriver'] as String?,
      nameDriver: item['nameDriver'] as String?,
      patronymicDriver: item['patronymicDriver'] as String?,
    );
  }).toList();
}

/// форматирует номер телефона для авторизации
String? phoneToAvtorization(String phone) {
// Удаляем все символы, кроме цифр и плюса
  final cleaned = phone.replaceAll(RegExp(r'[^\d+]'), '');

  // Проверка, что начинается с "+"
  if (!cleaned.startsWith('+')) {
    // Если начинается с 8 или 7, заменяем на +7 (Россия)
    if (cleaned.startsWith('8')) {
      return '+7${cleaned.substring(1)}';
    } else if (cleaned.startsWith('7')) {
      return '+7${cleaned.substring(1)}';
    } else {
      return null; // Недопустимый формат
    }
  }

  // Возвращаем очищенный номер
  return cleaned;
}

/// Заменяем все опасные символы (пробелы, слэши, знаки препинания) на нижнее
/// подчеркивание.
///
/// Оставляем только латинские буквы, цифры, дефис и нижнее подчеркивание
String? transliterate(String? str) {
  if (str == null || str.isEmpty) {
    return str;
  }

  const map = {
    'а': 'a',
    'б': 'b',
    'в': 'v',
    'г': 'g',
    'д': 'd',
    'е': 'e',
    'ё': 'yo',
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
    'А': 'A',
    'Б': 'B',
    'В': 'V',
    'Г': 'G',
    'Д': 'D',
    'Е': 'E',
    'Ё': 'Yo',
    'Ж': 'Zh',
    'З': 'Z',
    'И': 'I',
    'Й': 'Y',
    'К': 'K',
    'Л': 'L',
    'М': 'M',
    'Н': 'N',
    'О': 'O',
    'П': 'P',
    'Р': 'R',
    'С': 'S',
    'Т': 'T',
    'У': 'U',
    'Ф': 'F',
    'Х': 'H',
    'Ц': 'Ts',
    'Ч': 'Ch',
    'Ш': 'Sh',
    'Щ': 'Sch',
    'Ъ': '',
    'Ы': 'Y',
    'Ь': '',
    'Э': 'E',
    'Ю': 'Yu',
    'Я': 'Ya'
  };

  String result = '';
  for (int i = 0; i < str.length; i++) {
    String char = str[i];
    result += map[char] ?? char;
  }

  // Заменяем все опасные символы (пробелы, слэши, знаки препинания) на нижнее подчеркивание
  // Оставляем только латинские буквы, цифры, дефис и нижнее подчеркивание
  return result.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_');
}
