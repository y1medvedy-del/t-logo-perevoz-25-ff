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

/// Вызывает Supabase RPC-функцию create_cash_transactions_for_application.
///
/// Используется для создания всех связанных транзакций по заявке, если оплата
/// производится наличными или переводом на карту.
///
/// Параметры:
/// - [pApplicationId] — ID заявки (int)
/// - [pCarrierUserId] — ID пользователя-перевозчика (int)
/// - [pWarehouseUserId] — ID пользователя склада (int)
/// - [pAmount] — сумма оплаты (double)
Future<String> createCashTransactions(
  int pApplicationId,
  int pCarrierUserId,
  int pWarehouseUserId,
  double pAmount,
) async {
  try {
    // Вызов Supabase функции
    final dynamic response = await Supabase.instance.client.rpc(
      'create_cash_transactions_for_application',
      params: {
        'p_application_id': pApplicationId,
        'p_carrier_user_id': pCarrierUserId,
        'p_warehouse_user_id': pWarehouseUserId,
        'p_amount': pAmount,
      },
    );

    return response.toString(); // Вернёт 'Успешно' или 'Ошибка: ...'
  } catch (e) {
    return 'Flutter error: $e';
  }

  return 'Unexpected error';
}
