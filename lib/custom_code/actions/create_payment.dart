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

/// Создает онлайн-платеж через серверную Edge Function create-payment.
///
/// Для purpose передается тип платежа: wallet_topup или order_payment. Для
/// wallet_topup передается amount. Для order_payment передаются
/// targetType=order и targetId=id заявки. Возвращает success,
/// onlinePaymentId, orderId, paymentId и paymentUrl.
Future<dynamic> createPayment(
  String purpose,
  double? amount,
  String? targetType,
  int? targetId,
) async {
  try {
    final body = <String, dynamic>{
      'purpose': purpose,
    };

    if (amount != null) {
      body['amount'] = amount;
    }

    if (targetType != null && targetType.isNotEmpty) {
      body['targetType'] = targetType;
    }

    if (targetId != null) {
      body['targetId'] = targetId;
    }

    final response = await SupaFlow.client.functions.invoke(
      'create-payment',
      body: body,
    );

    final data = response.data;

    if (data == null) {
      return {
        'success': false,
        'error': 'EMPTY_RESPONSE',
      };
    }

    if (data is Map<String, dynamic>) {
      return data;
    }

    return {
      'success': false,
      'error': 'INVALID_RESPONSE_FORMAT',
      'raw': data.toString(),
    };
  } catch (e) {
    return {
      'success': false,
      'error': 'FUNCTION_INVOKE_ERROR',
      'details': e.toString(),
    };
  }
}
