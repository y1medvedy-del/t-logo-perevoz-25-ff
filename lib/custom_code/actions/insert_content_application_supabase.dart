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

Future<String> insertContentApplicationSupabase(
  List<String>? stringsArray,
  int? idApplication,
  bool? isPhoto,
  bool? isVideo,
  bool? isDoc,
) async {
  // Проверка обязательных параметров
  if (stringsArray == null || idApplication == null) {
    return 'Ошибка: stringsArray и idApplication не могут быть null.';
  }

  final supabase = Supabase.instance.client;

  try {
    // Вызов хранимой процедуры через rpc
    final response = await supabase.rpc('insert_application_content', params: {
      'strings_array': stringsArray, // Массив строк для reference_file
      'id_application': idApplication, // ID приложения
      'photo': isPhoto ?? false, // Значение по умолчанию для photo
      'video': isVideo ?? false, // Значение по умолчанию для video
      'doc': isDoc ?? false, // Значение по умолчанию для doc
    });

    if (response.error != null) {
      throw Exception('Ошибка при вставке данных: ${response.error!.message}');
    }

    return response.data ?? 'Данные успешно вставлены.';
  } catch (e) {
    return 'Ошибка: ${e.toString()}';
  }
}
