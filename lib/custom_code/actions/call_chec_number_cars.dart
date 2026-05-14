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

Future<int?> callChecNumberCars(String? numberCar) async {
  // Проверяем, что параметр numberCar не равен null
  if (numberCar == null || numberCar.isEmpty) {
    print('Ошибка: параметр numberCar пустой или null.');
    return 0; // Возвращаем 0, если параметр некорректный
  }

  try {
    // Вызов функции chec_number_cars из Supabase
    final response = await Supabase.instance.client.rpc(
      'chec_number_cars', // Имя вашей функции в Supabase
      params: {'number_car_param': numberCar}, // Передача параметра в функцию
    );

    // Проверяем, что ответ содержит корректные данные
    if (response != null && response is int) {
      return response; // Возвращаем ID записи
    } else {
      return 0; // Если записи нет, возвращаем 0
    }
  } catch (error) {
    print('Ошибка при вызове функции chec_number_cars: $error');
    return 0; // Возвращаем 0 в случае исключения
  }
}
