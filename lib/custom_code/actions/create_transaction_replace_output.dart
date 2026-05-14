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

Future<int?> createTransactionReplaceOutput(
  int? walletId,
  int? userId,
  int? companyId,
  double? amount,
  String? transactionType,
  String? status,
  String? description,
  bool? paymentConfirmationRequired,
  int? userPaymentConfirmed,
  int? walletAdmin,
  bool? replaceOutput,
) async {
  // Проверка на null для обязательных параметров
  if (walletId == null ||
      userId == null ||
      amount == null ||
      transactionType == null ||
      status == null) {
    print('Required parameters are missing');
    return null;
  }

  try {
    // Вызов RPC функции через Supabase
    final response = await Supabase.instance.client.rpc(
      'create_transaction_replace_output',
      params: {
        'wallet_id': walletId,
        'user_id': userId,
        'company_id': companyId,
        'amount': amount,
        'transaction_type': transactionType,
        'status': status,
        'description': description,
        'payment_confirmation_required': paymentConfirmationRequired,
        'user_payment_confirmed': userPaymentConfirmed,
        'wallet_admin': walletAdmin,
        'replace_output': replaceOutput
      },
    );

    // Простой if-else для проверки успешности запроса
    if (response.error == null) {
      // Возвращаем идентификатор созданной транзакции
      return response.data['id'] as int?;
    } else {
      // Обработка ошибки
      print('Error: ${response.error!.message}');
      return null;
    }
  } catch (e) {
    // Обработка исключений
    print('Exception occurred: $e');
    return null;
  }
}
