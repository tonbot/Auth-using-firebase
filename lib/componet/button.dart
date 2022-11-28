import 'package:flutter/material.dart';

import 'colors.dart';

Container button(String title) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(
      top: 20.0,
      bottom: 20.0,
    ),
    color: blue,
    // ignore: prefer_const_constructors
    child: Text(
      title,
      style: TextStyle(
        color: white,
      ),
    ),
  );
}

// Initial Selected Value
String dropdownvalue = 'Football';
// List of items in our dropdown menu
var items = [
  'Football',
  'Basketball',
  'Hockey',
  'Running',
  'Chess',
  'Politics',
];
