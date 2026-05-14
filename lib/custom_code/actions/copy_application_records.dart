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

Future copyApplicationRecords(
  String tableName,
  int oldId,
  int newId,
) async {
  try {
    final supabase = Supabase.instance.client;

    // Вызов RPC-функции Supabase ЭТА ФУНКЦИЯ КОПИРУЕТ СТАРЫЕ ЗАПИСИ С НОВЫМ ID
    final response = await supabase.rpc('copy_application_records', params: {
      'table_name': tableName,
      'old_id': oldId,
      'new_id': newId,
    });

    if (response.error != null) {
      throw Exception('Ошибка Supabase: ${response.error!.message}');
    }

    debugPrint('✅ Копирование записей успешно завершено');
  } catch (e) {
    debugPrint('❌ Ошибка при копировании записей: $e');
  }
}
