// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final authInstance = FirebaseAuth.instance;

//Sign in user
  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      final userCredential = await authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user!.emailVerified) {
        //navigate to the home page
        Navigator.pushReplacementNamed(
          context,
          '/Home',
        );
        return;
      }
      //else user email not verified
      Navigator.pushReplacementNamed(
        context,
        '/Verification',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e.code);
      }
    }
  }

//create new user
  void createUser(userCredential, BuildContext context) async {
    try {
      final userData = <String, dynamic>{
        "email": userCredential["email"],
        "phone": userCredential["phone"],
        "interest": userCredential["interest"]
      };
      //authentication
      final credential = await authInstance.createUserWithEmailAndPassword(
        email: userCredential["email"],
        password: userCredential["password"],
      );
      //store user data to db
      db.collection("user").doc(credential.user?.uid).set(userData);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(
        context,
        '/Verification',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<void> sendVerificationLink(UserCredential credential) async {
  //   final user = credential.user;
  //   await user!.sendEmailVerification();
  // }
}
