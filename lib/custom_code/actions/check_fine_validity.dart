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

/// запуск функции на сервере которая проверяет актуальность штрафов 24 часа
/// действует штраф
Future<String> checkFineValidity() async {
  final functionName = 'check_fine_validity';

  try {
    final response =
        await Supabase.instance.client.rpc(functionName, params: {});

    if (response == null) {
      return 'Функция вернула пустой ответ';
    }

    return 'Функция выполнена успешно: $response';
  } catch (e) {
    return 'Ошибка при вызове функции: $e';
  }
}
