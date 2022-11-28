import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String email = "";
  bool isEmailVerified = false;
  late Timer time;
//sending verification link
  Future<void> sendVerificationLink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
    setState(() {
      email = user.email!;
    });

    //reload user after 5 seconds
    time = Timer.periodic(Duration(seconds: 5), (timer) {
      verify();
    });
  }

  Future<void> verify() async {
    print("I am called");
    FirebaseAuth.instance.currentUser!.reload();
    final user = FirebaseAuth.instance.currentUser!;
    if (user.emailVerified) {
      time.cancel();
      Navigator.pushReplacementNamed(
        context,
        '/Home',
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    sendVerificationLink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Email verification has been sent to $email"),
    ));
  }
}
