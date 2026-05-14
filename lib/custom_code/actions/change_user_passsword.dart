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
import 'package:http/http.dart' as http;

Future<bool> changeUserPasssword(String email) async {
  // Add your function code here!
  const String url = 'https://supabase.t-logo.ru/functions/v1/changepassword';

  try {
    // Создание тела запроса
    final Map<String, String> requestBody = {
      'email': email,
    };

    // Отправка POST-запроса
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(requestBody),
    );

    // Проверка статуса ответа
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Ошибка: ${response.statusCode}, ${response.body}');
      return false;
    }
  } catch (e) {
    print('Исключение при отправке запроса: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
