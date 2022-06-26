import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/intro_box.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IntroBox(),
            Text(
              "Mobile Screen",
              style: TextStyle(
                color: GlobalVariables.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
