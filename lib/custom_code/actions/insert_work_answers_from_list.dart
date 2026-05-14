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

Future insertWorkAnswersFromList(
  List<WorkQuantityPriceStruct>? workList,
  int? createdUser,
  int? answerID,
) async {
  // Проверяем входные параметры
  if (workList == null || createdUser == null || answerID == null) {
    return false;
  }

  // Преобразуем workList в массив объектов, который можно передать в Supabase
  final List<Map<String, dynamic>> workData = workList.map((workItem) {
    return {
      'name_work': workItem.nameWork, // Поле name_work
      'quantity': workItem.quantity, // Поле quantity
      'price': workItem.price, // Поле price
    };
  }).toList();

  // Вызов RPC-функции insert_work_answers
  final response =
      await Supabase.instance.client.rpc('insert_work_answers', params: {
    'p_work_list': workData, // Массив объектов work_quantity_price
    'p_created_user': createdUser,
    'p_answer_id': answerID,
  });

  // Проверяем наличие ошибки в ответе
  if (response.error != null) {
    print('Error: ${response.error!.message}');
    return false; // Возвращаем false, если запрос не удался
  }

  return true; // Возвращаем true, если запрос выполнен успешно
}
