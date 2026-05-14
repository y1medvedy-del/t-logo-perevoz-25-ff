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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

/// Custom Action
///
/// Вызывает SQL-функцию Supabase:
/// public.generate_application_pdf(
///   p_application_id,
///   p_customer_place_1,
///   p_customer_place_2,
///   p_doc_name,
///   p_executor_place,
///   p_folder
/// )
///
/// Входные параметры:
/// - idApplication   — ID заявки
/// - docName         — имя файла без расширения .pdf
/// - folder          — путь в Storage (например: sample/generated)
/// - customerPlace1  — подпись/печать заказчика (место 1)
/// - customerPlace2  — подпись/печать заказчика (место 2)
/// - executorPlace   — подпись/печать исполнителя
///
/// Возвращает:
/// - String URL на PDF
/// - либо строку ошибки формата: ERROR: stage=... | ...
Future<String> createApplicationDocPdf(
  int idApplication,
  String docName,
  String folder,
  bool customerPlace1,
  bool customerPlace2,
  bool executorPlace,
) async {
  String stage = 'start';

  Map<String, dynamic>? _lastParams;

  const rpcFunctionName = 'generate_application_pdf';

  String error(String message, [Object? details]) {
    final d = details == null ? '' : ' | details=$details';
    return 'ERROR: stage=$stage | $message$d';
  }

  try {
    stage = 'validate_input';

    if (idApplication <= 0) {
      return error('idApplication должен быть > 0', idApplication);
    }
    if (docName.trim().isEmpty) {
      return error('docName пустой');
    }
    if (folder.trim().isEmpty) {
      return error('folder пустой');
    }

    stage = 'get_supabase_client';
    final supabase = Supabase.instance.client;

    stage = 'rpc_call';

    final params = {
      // ВАЖНО: ключи должны совпадать с ИМЕНАМИ параметров в Postgres-функции
      // (судя по ошибке/подсказке PostgREST)
      'p_application_id': idApplication,
      'p_customer_place_1': customerPlace1,
      'p_customer_place_2': customerPlace2,
      'p_doc_name': docName,
      'p_executor_place': executorPlace,
      'p_folder': folder,
    };

    // Сохраняем для диагностики (чтобы вернуть в тексте ошибки)
    _lastParams = params;

    final dynamic result = await supabase.rpc(
      rpcFunctionName,
      params: params,
    );

    stage = 'validate_result';

    if (result == null) {
      return error('RPC вернул null', params);
    }

    final url = result is String ? result : result.toString();

    if (url.trim().isEmpty) {
      return error('RPC вернул пустую строку', result);
    }

    stage = 'done';
    return url;
  } catch (e) {
    return error('Exception поймали в catch', {
      'exception': e,
      'params': _lastParams,
    });
  }
}
