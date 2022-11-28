import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

TextFormField textBox(
    TextEditingController _controller, String label, String hint) {
  return TextFormField(
    controller: _controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
      hintText: hint,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
}

TextFormField emailField(
    TextEditingController _controller, String label, String hint) {
  return TextFormField(
    controller: _controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
      hintText: hint,
    ),
    validator: (value) {
      final bool isValid = EmailValidator.validate(value!);
      if (!isValid) {
        return 'Invalid Email';
      }
      return null;
    },
  );
}

TextFormField passWordField(
    isObscureText, _passwordController, String label, String hint) {
  return TextFormField(
    controller: _passwordController,
    obscureText: isObscureText,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
      hintText: hint,
    ),
    validator: (value) {
      if (value!.length < 6) {
        return 'Password length should be six at minimum';
      }
      return null;
    },
  );
}
