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

import '/backend/supabase/database/database.dart';

/// Проверяет активные штрафы компании в выбранном городе.
///
/// Если с момента создания штрафа прошло больше 24 часов, штраф автоматически
/// отменяется. При отмене обновляет: - valid = false - status = 'Отменена' -
/// comment = 'Автоматическая отмена по истечению 24 часов' Возвращает
/// текстовый результат с количеством обновленных штрафов.
Future<String> cancelExpiredFinesByCompanyAndCity(
  int companyId,
  String city,
) async {
  try {
    final fines = await FineTable().queryRows(
      queryFn: (q) => q
          .eqOrNull('company_id', companyId)
          .eqOrNull('city_bloking', city)
          .eqOrNull('valid', true),
    );

    final cutoff = DateTime.now().subtract(const Duration(hours: 24));

    final expiredFines =
        fines.where((fine) => fine.createdAt.isBefore(cutoff)).toList();

    if (expiredFines.isEmpty) {
      return 'Просроченных штрафов не найдено';
    }

    for (final fine in expiredFines) {
      await FineTable().update(
        data: {
          'valid': false,
          'status': 'Отменена',
          'comment': 'Автоматическая отмена по истечению 24 часов',
        },
        matchingRows: (rows) => rows.eqOrNull('id', fine.id),
      );
    }

    return 'Отменено штрафов: ${expiredFines.length}';
  } catch (e) {
    return 'Ошибка при проверке штрафов: $e';
  }
}
