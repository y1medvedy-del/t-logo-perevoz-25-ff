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

/// Оплачивает штраф с кошелька перевозчика через RPC. Создает списание и
/// встречное зачисление, затем возвращает результат операции строкой.
///
/// И вариант совсем в стиле FlutterFlow-подписи:
///
/// Серверная оплата штрафа с кошелька. Создает две транзакции и возвращает
/// статус выполнения или текст ошибки.
Future<String> callWalletFinePayment(
  int carrierUserId,
  int fineId,
) async {
  try {
    final response = await Supabase.instance.client.rpc(
      'wallet_fine_payment',
      params: {
        'p_carrier_user_id': carrierUserId,
        'p_fine_id': fineId,
        'p_description': 'Оплата штрафа',
      },
    );

    if (response == null) {
      return 'Нет ответа от сервера.';
    }

    return response.toString();
  } catch (error) {
    return 'Ошибка: ${error.toString()}';
  }
}
