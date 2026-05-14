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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> loginWithPhonePassword(String phone) async {
  final supabase = Supabase.instance.client;

  const String defaultPassword =
      '12345678'; // тот, что использовался при создании

  try {
    final res = await supabase.auth.signInWithPassword(
      phone: phone,
      password: defaultPassword,
    );

    return res.session != null;
  } on AuthException catch (e) {
    print('Login error: ${e.message}');
    return false;
  } catch (e) {
    print('Unexpected error: $e');
    return false;
  }
}
