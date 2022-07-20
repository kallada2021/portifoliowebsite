import 'package:flutter/material.dart';

import 'global_variables.dart';

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

  static Future<void> showPictureBox(
      BuildContext context, String title, String imageUrl) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: GlobalVariables.kLightBlue,
          title: Center(
            child: Text(
              title,
              style: GlobalVariables.kTechNameStyle,
            ),
          ),
          content: Image.network(imageUrl),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text(
                "Close",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.teal[800],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
