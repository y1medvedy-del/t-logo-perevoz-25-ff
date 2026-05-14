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

import 'dart:convert';

Future<dynamic> addClientToJson(
  dynamic sourceJson, // сюда передаём уже готовый JSON (Map или String)
  int clientCompanyId,
  int clientNds,
  String clientSignerPosition,
  String clientSignerName,
  String dateSigner,
) async {
  Map<String, dynamic> data = {};

  // Поддерживаем оба варианта: пришла строка или Map
  if (sourceJson is String && sourceJson.trim().isNotEmpty) {
    try {
      data = jsonDecode(sourceJson) as Map<String, dynamic>;
    } catch (e) {
      // если не получилось распарсить — оставим пустой объект
      data = {};
    }
  } else if (sourceJson is Map) {
    data = Map<String, dynamic>.from(sourceJson as Map);
  }

  // Добавляем/перезаписываем client
  data['client'] = {
    'company_id': clientCompanyId,
    'nds': clientNds,
    'signer_position': clientSignerPosition ?? '',
    'signer_name': clientSignerName ?? '',
    'signer_date': dateSigner ?? '',
  };

  return data;
}
