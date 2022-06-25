import 'package:flutter/material.dart';

String uri = "http://localhost:8000";

class GlobalVariables {
  //COLORS
  static const appBarGradient = LinearGradient(colors: [
    Color.fromARGB(255, 29, 201, 192),
    Color.fromARGB(255, 125, 221, 216),
  ], stops: [
    0.5,
    1.0
  ]);

  static var secondaryColor = Colors.pink[600]!;
  static const backgroundColor = Colors.white;
  static var grayBackgroundColor = Colors.blueGrey[200]!;
  static var lightBlue = Colors.blue[200];
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.teal;

  static const lineHeight = 30.0;
  static const lineWidth = 40.0;
}
