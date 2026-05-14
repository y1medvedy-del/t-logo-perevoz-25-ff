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

/// Создает платежный запрос по штрафу в payment_requests.
///
/// Ничего не списывает и не начисляет. Используется для методов wallet,
/// invoice и cash как единая точка старта оплаты штрафа.
Future<dynamic> createFinePaymentRequest(
  int fineId,
  int carrierUserId,
  String paymentMethod,
  String recipientType,
) async {
  try {
    if (!['wallet', 'invoice', 'cash', 'tbank_card'].contains(paymentMethod)) {
      return {
        'success': false,
        'error': 'Неподдерживаемый способ оплаты: $paymentMethod',
      };
    }

    final fineResp = await Supabase.instance.client
        .from('fine')
        .select('id, amount, valid, status')
        .eq('id', fineId)
        .maybeSingle();

    if (fineResp == null) {
      return {'success': false, 'error': 'Штраф не найден'};
    }

    final fineAmount = (fineResp['amount'] as num?)?.toDouble() ?? 0.0;
    final fineValid = fineResp['valid'] == true;
    final fineStatus = (fineResp['status'] ?? '').toString();

    if (!fineValid || fineStatus == 'Оплачена') {
      return {
        'success': false,
        'error': 'Штраф уже оплачен или недействителен'
      };
    }

    if (fineAmount <= 0) {
      return {'success': false, 'error': 'У штрафа не указана сумма'};
    }

    final userResp = await Supabase.instance.client
        .from('user')
        .select('id, "id company"')
        .eq('id', carrierUserId)
        .maybeSingle();

    if (userResp == null || userResp['id company'] == null) {
      return {'success': false, 'error': 'Не найдена компания перевозчика'};
    }

    final companyId = userResp['id company'] as int;

    final walletResp = await Supabase.instance.client
        .from('wallets')
        .select('id, company_id')
        .eq('company_id', companyId)
        .order('id')
        .limit(1)
        .maybeSingle();

    if (walletResp == null) {
      return {'success': false, 'error': 'Не найден кошелек перевозчика'};
    }

    final walletId = walletResp['id'] as int;
    final requestKey =
        'fine_${paymentMethod}_${fineId}_${DateTime.now().millisecondsSinceEpoch}';

    final inserted = await Supabase.instance.client
        .from('payment_requests')
        .insert({
          'operation_type': 'fine_payment',
          'payment_method': paymentMethod,
          'recipient_type': recipientType,
          'status': 'created',
          'request_key': requestKey,
          'created_by': carrierUserId,
          'payer_company_id': companyId,
          'fine_id': fineId,
          'wallet_id': walletId,
          'base_amount': 0,
          'markup_amount': 0,
          'warehouse_commission': 0,
          'card_commission': 0,
          'total_amount': fineAmount,
          'description': 'Оплата штрафа',
        })
        .select('id')
        .single();

    final paymentRequestId = inserted['id'];
    if (paymentRequestId == null) {
      return {'success': false, 'error': 'Не удалось создать платежный запрос'};
    }

    return {
      'success': true,
      'paymentRequestId': paymentRequestId,
      'fineId': fineId,
      'walletId': walletId,
      'amount': fineAmount,
      'paymentMethod': paymentMethod,
    };
  } catch (e) {
    return {
      'success': false,
      'error': 'Ошибка при создании платежного запроса: $e',
    };
  }
}
