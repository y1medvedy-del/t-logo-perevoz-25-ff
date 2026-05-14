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

import 'dart:convert'; // Для работы с JSON
import 'package:http/http.dart' as http; // Для выполнения HTTP-запросов

Future<dynamic> fetchGeolocationSuggestions(
  double? lat,
  double? lon,
  String? token,
) async {
  // Проверяем, что широта и долгота не равны null
  if (lat == null || lon == null || token == null) {
    throw Exception('Latitude, longitude, and token must not be null');
  }

  final String url =
      'http://suggestions.dadata.ru/suggestions/api/4_1/rs/geolocate/address'
      '?token=$token&lat=$lat&lon=$lon&count=10&radius_meters=1000';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Если сервер возвращает ответ OK, парсим JSON
      return json.decode(response.body)['suggestions'];
    } else {
      // Если сервер не возвращает ответ OK, выбрасываем исключение
      throw Exception('Failed to load suggestions: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error occurred while fetching suggestions: $e');
  }
}
