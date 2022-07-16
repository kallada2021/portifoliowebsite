import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(text),
    ),
  );
}

class Utils {
  BuildContext context;
  Utils(this.context);
  Size get screenSize => MediaQuery.of(context).size;
}
