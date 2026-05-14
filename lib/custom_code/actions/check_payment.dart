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

/// Универсальная проверка платежа.
///
/// По purpose выбирает нужную серверную функцию: для wallet_topup вызывает
/// check-wallet-topup-payment, для order_payment вызывает check-payment. Для
/// кошелька использует paymentId и orderId, для заявки использует targetType
/// и targetId. Возвращает статус платежа и данные для дальнейшей логики.

Future<dynamic> checkPayment(
  String purpose,
  String? paymentId,
  String? orderId,
  String? targetType,
  int? targetId,
) async {
  try {
    if (purpose == 'wallet_topup') {
      final response = await SupaFlow.client.functions.invoke(
        'check-wallet-topup-payment',
        body: {
          'paymentId': paymentId,
          'orderId': orderId,
        },
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
    }

    if (purpose == 'order_payment' || purpose == 'fine_payment') {
      final response = await SupaFlow.client.functions.invoke(
        'check-payment',
        body: {
          'purpose': purpose,
          'targetType': targetType,
          'targetId': targetId,
        },
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
    }

    return {
      'success': false,
      'error': 'UNSUPPORTED_PURPOSE',
      'details': purpose,
    };
  } catch (e) {
    return {
      'success': false,
      'error': 'FUNCTION_INVOKE_ERROR',
      'details': e.toString(),
    };
  }
}
