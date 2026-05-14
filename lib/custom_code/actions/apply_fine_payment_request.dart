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

/// Применяет платежный запрос по штрафу через серверную RPC.
///
/// Сервер создает транзакции, проверяет срок действия штрафа и обновляет
/// статусы. На клиенте нужно проверить success и показать результат
/// пользователю.

Future<dynamic> applyFinePaymentRequest(
  int paymentRequestId,
  int confirmedBy,
) async {
  try {
    if (paymentRequestId <= 0) {
      return {'success': false, 'error': 'Некорректный paymentRequestId'};
    }
    if (confirmedBy <= 0) {
      return {'success': false, 'error': 'Некорректный confirmedBy'};
    }

    // Берем fine_id из payment_requests.
    final pr = await Supabase.instance.client
        .from('payment_requests')
        .select('id, fine_id')
        .eq('id', paymentRequestId)
        .maybeSingle();

    if (pr == null) {
      return {'success': false, 'error': 'Платежный запрос не найден'};
    }

    final fineId = pr['fine_id'] as int?;
    if (fineId == null) {
      return {'success': false, 'error': 'В запросе не указан fine_id'};
    }

    // Пытаемся достать номер заявки, связанной со штрафом.
    final fineRow = await Supabase.instance.client
        .from('fine')
        .select('id, application_id')
        .eq('id', fineId)
        .maybeSingle();

    String description = 'Оплата штрафа';
    if (fineRow != null && fineRow['application_id'] != null) {
      final appId = fineRow['application_id'] as int;
      final appRow = await Supabase.instance.client
          .from('aplication')
          .select('id, namber')
          .eq('id', appId)
          .maybeSingle();

      final appNumber = appRow?['namber']?.toString();
      if (appNumber != null && appNumber.trim().isNotEmpty) {
        description = 'Оплата штрафа по заявке №$appNumber';
      } else {
        description = 'Оплата штрафа по заявке #$appId';
      }
    }

    // Явный JSON параметров для RPC (как ты просил).
    final rpcParams = <String, dynamic>{
      'p_payment_request_id': paymentRequestId,
      'p_confirmed_by': confirmedBy,
      'p_description': description,
    };

    final rpcResult = await Supabase.instance.client
        .rpc('apply_fine_payment_request', params: rpcParams);

    if (rpcResult is Map<String, dynamic>) {
      return rpcResult;
    }
    if (rpcResult is Map) {
      return Map<String, dynamic>.from(rpcResult);
    }

    return {
      'success': false,
      'error': 'RPC вернул неожиданный формат ответа',
      'raw': rpcResult?.toString(),
    };
  } catch (e) {
    return {
      'success': false,
      'error': 'Ошибка при применении оплаты штрафа: $e',
    };
  }
}
