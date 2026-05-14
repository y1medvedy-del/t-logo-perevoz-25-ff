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

Future<String?> addWorksToSupabase(
  List<WorksStruct>? listWorks,
  int? idApplication,
) async {
  if (listWorks == null || idApplication == null) {
    return 'Ошибка: список работ или ID приложения равны null';
  }

  final List<Map<String, dynamic>> worksData = [];

  for (var work in listWorks) {
    final workData = <String, dynamic>{
      if (work.idAnswer != null) 'idAnswer': work.idAnswer,
      if (work.nameService != null) 'nameService': work.nameService,
      if (work.quantity != null) 'quantity': work.quantity,
      if (work.uniteSize != null) 'uniteSize': work.uniteSize,
      if (work.price != null) 'price': work.price,
      if (work.newQuantity != null)
        'new quantity':
            work.newQuantity, // Исправлено на правильное имя колонки
      if (work.newPrice != null) 'newPrice': work.newPrice,
      if (work.typeGruz != null) 'typeGruz': work.typeGruz,
      'idApplication': idApplication,
    };

    worksData.add(workData);
  }

  final supabase = Supabase.instance.client;

  try {
    final response = await supabase.from('works_application').insert(worksData);

    if (response.error == null) {
      return 'Данные успешно добавлены в таблицу';
    } else {
      return 'Ошибка при вставке данных: ${response.error!.message}';
    }
  } catch (e) {
    return 'Исключение при вставке данных: $e';
  }
}
