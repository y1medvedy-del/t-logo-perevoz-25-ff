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

Future workListEdit(
  List<WorksStruct>? listWorks,
  String? nameWork,
  int? quantity,
) async {
  // Add your function code here!
// Проверяем, что список и имя работы не пустые
  if (listWorks == null || nameWork == null || nameWork.isEmpty) {
    return;
  }

  // Ищем элемент в списке по имени работы
  int existingIndex =
      listWorks.indexWhere((work) => work.nameService == nameWork);

  if (existingIndex != -1) {
    // Если элемент найден и quantity равно 0 или null — удаляем его
    if (quantity == null || quantity == 0) {
      listWorks.removeAt(existingIndex);
    } else {
      // Иначе обновляем количество напрямую
      listWorks[existingIndex] = WorksStruct(
        nameService: listWorks[existingIndex].nameService,
        quantity: quantity,
      );
    }
  } else {
    // Если элемент не найден и quantity больше нуля — добавляем новый элемент
    if (quantity != null && quantity > 0) {
      listWorks.add(WorksStruct(
        nameService: nameWork,
        quantity: quantity,
      ));
    }
  }
}
