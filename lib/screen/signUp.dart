import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_friends/componet/colors.dart';
import 'package:sport_friends/plugin/firebase/auth.dart';

import '../componet/button.dart';
import '../componet/inputTextField.dart';
import '../componet/spaces.dart';
import '../model/users.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isObscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpasswordController = TextEditingController();
  final _interestController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map userCredentials = <String, dynamic>{};

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _interestController.dispose();
    _cpasswordController.dispose();
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
        child: Form(
          key: _formKey,
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              //email field

              emailField(_emailController, "Email", "Enter Email"), //Email
              verticalSpace(20.0),
              textBox(_phoneController, "Phone", "Enter Phone"), //PHONE NUMBER
              verticalSpace(20.0),
              _dropDowm(),
              verticalSpace(20.0),
              passWordField(true, _passwordController, "Password",
                  "Enter Password"), //Password
              verticalSpace(20.0),
              passWordField(true, _cpasswordController, "Password",
                  "Confirm Password"), //Confirm Password
              verticalSpace(20.0),
              //login button
              InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (_cpasswordController.text !=
                          _passwordController.text) {
                        print("PASSWORD NOT THE SAME");
                        return;
                      }
                      userCredentials = {
                        "email": _emailController.text.toString(),
                        "phone": _phoneController.text.toString(),
                        "password": _passwordController.text.toString(),
                        "interest": "football"
                      };
                      Auth auth = new Auth();
                      auth.createUser(userCredentials, context);
                    }
                  },
                  child: button("SIGNUP")),
              //space
              verticalSpace(20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/Login");
                      },
                      child: text("Already have an account? Login")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//Text
  Text text(String dispalyText) {
    return Text(dispalyText);
  }

  Widget _dropDowm() {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      color: Colors.black12,
      child: DropdownButton(
        // Initial Value
        hint: text(
          "Select your interest",
        ),
        value: dropdownvalue,
        // Down Arrow Icon
        icon: Icon(Icons.keyboard_arrow_down),
        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
      ),
    );
  }
}
