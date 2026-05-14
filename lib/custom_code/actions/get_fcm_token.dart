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

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Действие которое получает токен и создает запись в  таблице
/// user_push_tokens если ее нет
Future<String?> getFcmToken() async {
  try {
    final supabase = Supabase.instance.client;

    // 0. Проверяем авторизацию
    final authUserId = supabase.auth.currentUser?.id;
    if (authUserId == null) {
      return null;
    }

    // 1. Запрос разрешений
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      return null;
    }

    // 2. Получаем токен
    final token = await FirebaseMessaging.instance.getToken();
    if (token == null || token.isEmpty) {
      return null;
    }

    // 3. Определяем платформу
    String platform = 'unknown';
    if (kIsWeb) {
      platform = 'web';
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          platform = 'android';
          break;
        case TargetPlatform.iOS:
          platform = 'ios';
          break;
        case TargetPlatform.windows:
          platform = 'pc_windows';
          break;
        case TargetPlatform.macOS:
          platform = 'pc_macos';
          break;
        case TargetPlatform.linux:
          platform = 'pc_linux';
          break;
        default:
          platform = 'other';
      }
    }

    // 4. Получаем bigint id из public.user
    final userRow = await supabase
        .from('user')
        .select('id')
        .eq('user_id_authorization', authUserId)
        .maybeSingle();

    final int? userId = userRow?['id'];

    // 5. Проверяем — есть ли уже такой токен
    final existing = await supabase
        .from('user_push_tokens')
        .select('id')
        .eq('token', token)
        .eq('uuid_user', authUserId)
        .maybeSingle();

    if (existing == null) {
      await supabase.from('user_push_tokens').insert({
        'user_id': userId,
        'token': token,
        'platform': platform,
        'uuid_user': authUserId,
      });
    }

    return token;
  } catch (e) {
    debugPrint('FCM error: $e');
    return null;
  }
}
