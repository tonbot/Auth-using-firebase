import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_friends/screen/home.dart';
import 'package:sport_friends/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sport_friends/screen/verification.dart';
import 'firebase_options.dart';

import 'screen/signUp.dart';

Future<void> main() async {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          //<-- SEE HERE
          // Status bar color
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
    routes: {
      "/Login": (context) => const Login(),
      "/Signup": (context) => const Signup(),
      "/Verification": (context) => const Verification(),
      "/Home": (context) => const Home(),
    },
    home: const Login(),
  ));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
