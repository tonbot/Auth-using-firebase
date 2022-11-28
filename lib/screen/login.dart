import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_friends/plugin/firebase/auth.dart';
import 'package:sport_friends/screen/signUp.dart';

import '../componet/button.dart';
import '../componet/inputTextField.dart';
import '../componet/spaces.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObscureText = true;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            //email field
            textBox(_emailController, "Email", "Enter Email"),
            //space
            verticalSpace(20.0),
            //password field
            passWordField(
                true, _passwordController, "Password", "Enter Password"),
            //space
            verticalSpace(20.0),
            //button
            InkWell(
                onTap: (() {
                  Auth auth = new Auth();
                  auth.signIn(_emailController.text,
                      _passwordController.text.toString(), context);
                }),
                child: button("LOGIN")),
            //space
            verticalSpace(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      // Navigator.pushReplacementNamed(context, "/Signup");
                    },
                    child: text("Forgot Password")),
                InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/Signup");
                    },
                    child: text("Dont have an account? Signup")),
              ],
            )
          ],
        ),
      ),
    );
  }

//Text
  Text text(String dispalyText) {
    return Text(dispalyText);
  }
}
