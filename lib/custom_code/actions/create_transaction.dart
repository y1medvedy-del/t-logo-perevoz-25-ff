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

Future createTransaction(
  int? walletId,
  int? userId,
  double? amount,
  String? transactionType,
  String? status,
  String? description,
  int? applicationId,
  bool? paymentConfirmationRequired,
  int? executerId,
) async {
  // Проверяем, что все необходимые параметры переданы
  if (walletId == null ||
      userId == null ||
      amount == null ||
      transactionType == null ||
      status == null) {
    throw Exception('Missing required parameters');
  }

  // Вызов функции Supabase для создания транзакции
  final response =
      await Supabase.instance.client.rpc('create_transaction', params: {
    'p_wallet_id': walletId,
    'p_user_id': userId,
    'p_amount': amount,
    'p_transaction_type': transactionType,
    'p_status': status,
    'p_description': description ?? '',
    'p_application_id': applicationId,
    'p_payment_confirmation_required': paymentConfirmationRequired ?? false,
    'p_executer_id': executerId,
  }).maybeSingle(); // Используем maybeSingle() для получения одного результата или null

  // Проверка успешности выполнения транзакции
  if (response == null) {
    // Обработка ошибки, если транзакция не выполнена
    throw Exception('Transaction failed');
  }
}
