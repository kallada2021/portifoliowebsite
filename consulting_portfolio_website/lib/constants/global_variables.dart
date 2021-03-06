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

  static var kSecondaryColor = Colors.purple[700]!;
  static const kBackgroundColor = Colors.white;
  static var kGrayBackgroundColor = Colors.blueGrey[200]!;
  static var kLightBlue = Colors.blue[200];
  static var kSelectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.teal;
  static Color kBorderColor = Colors.deepPurple[800]!;

  static const kLineHeight = 30.0;
  static const kLineWidth = 40.0;

  static TextStyle kAppBarTextStyle =
      const TextStyle(color: Colors.white, fontSize: 16);

  static TextStyle kTechNameStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    color: Colors.deepPurple[900],
    fontFamily: "Arial",
  );

  static const TextStyle kTechPageTitleStyle = TextStyle(
    fontSize: 50,
    fontStyle: FontStyle.normal,
    color: Colors.black87,
  );
  static const TextStyle kFooterTextStyle = TextStyle(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );

  static const String s3Url =
      "https://testing-portfolio-website-magnolia-bucket.s3.amazonaws.com/Images/";
}
