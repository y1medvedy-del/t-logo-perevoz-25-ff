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

import 'package:http/http.dart' as http; // Импортируем пакет http
import 'dart:convert'; // Импортируем пакет для работы с JSON

Future<List<dynamic>> geocoding(LatLng? geo) async {
  // Add your function code here!
  if (geo == null) {
    return []; // Возвращаем пустой список, если geo равно null
  }

  final String url =
      'http://suggestions.dadata.ru/suggestions/api/4_1/rs/geolocate/address';
  final String token =
      'Token 0aa05315e52d1617a20c2dff2aa8b8a3b2649658'; // Ваш токен

  final Map<String, dynamic> body = {
    "lat": geo.latitude,
    "lon": geo.longitude,
    "radius_meters": 500,
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    },
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    // Если запрос успешен, парсим JSON и возвращаем данные
    final List<dynamic> jsonResponse = jsonDecode(response.body)['suggestions'];
    return jsonResponse; // Возвращаем массив предложений
  } else {
    // В случае ошибки выводим сообщение и возвращаем пустой список
    print('Ошибка при получении данных: ${response.statusCode}');
    return [];
  }
}
