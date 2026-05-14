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

Future<String> callWalletPayment(
  int carrierUserId,
  int warehouseUserId,
  double amount,
  int applicationId,
) async {
  try {
    final response =
        await Supabase.instance.client.rpc('wallet_payment', params: {
      'p_carrier_user_id': carrierUserId,
      'p_warehouse_user_id': warehouseUserId,
      'p_amount': amount,
      'p_application_id': applicationId,
      'p_description': '', // Заглушка, чтобы соблюсти сигнатуру функции
    });

    if (response == null) {
      return 'Нет ответа от сервера.';
    }

    return response.toString();
  } catch (error) {
    return 'Ошибка: ${error.toString()}';
  }
}
