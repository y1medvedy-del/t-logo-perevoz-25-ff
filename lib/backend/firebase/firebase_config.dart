import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD20jmij1cytV7neoeK8BLhjtIWmiTNtyU",
            authDomain: "t-logo-a-d-m-i-n25-3sa73i.firebaseapp.com",
            projectId: "t-logo-a-d-m-i-n25-3sa73i",
            storageBucket: "t-logo-a-d-m-i-n25-3sa73i.firebasestorage.app",
            messagingSenderId: "294759838812",
            appId: "1:294759838812:web:6b45cc9f0e3114045ae299",
            measurementId: "G-5TNXWQ0QPF"));
  } else {
    await Firebase.initializeApp();
  }
}
