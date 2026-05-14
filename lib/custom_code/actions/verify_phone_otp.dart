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

Future<bool> verifyPhoneOtp(
  String phone,
  String? token,
) async {
  // Instantiate Supabase client
  final supabase = Supabase.instance.client;

  try {
    // Call the supabase verifyOTP function for phone authentication
    // If successful, a response with the user and session is returned
    final AuthResponse res = await supabase.auth.verifyOTP(
      type: OtpType.sms,
      token: token ?? "",
      phone: phone,
    );

    // Return true if session is not null (i.e. user has signed in)
    return res.session != null;
  } on AuthException catch (e) {
    // Catch any authentication errors and print them to the console
    print('Auth exception: ${e.message}');
    return false;
  } catch (error) {
    // Catch any other errors
    print('Unexpected error: $error');
    return false;
  }
}
