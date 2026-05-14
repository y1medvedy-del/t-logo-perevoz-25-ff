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

import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:pushy_flutter/pushy_flutter.dart';

Future<void> startPushyService() async {
  // Не запускаем Pushy на Web
  if (kIsWeb) return;

  if (Platform.isAndroid || Platform.isIOS) {
    try {
      String token = await Pushy.register();
      print('Pushy device token: $token');

      Pushy.listen();

      Pushy.setNotificationListener((Map<String, dynamic> data) {
        print("Pushy уведомление: $data");
        Pushy.notify("Перепаллетить.рф", data['message'] ?? "Сообщение", data);
        Pushy.clearBadge();
      });
    } catch (e) {
      print('Ошибка при запуске Pushy: $e');
    }
  }
}
