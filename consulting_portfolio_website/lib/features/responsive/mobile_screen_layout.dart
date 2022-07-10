import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/intro_box.dart';
import 'package:consulting_portfolio_website/features/widgets/appdrawer.dart';
import 'package:flutter/material.dart';

import '../screens/technologies_screen.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        elevation: 2.0,
        title: Text("MAGNOLIA CONSULTING"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              IntroBox(),
              Text(
                "Mobile Screen",
                style: TextStyle(
                  color: GlobalVariables.kSecondaryColor,
                ),
              ),
              const TechnologiesScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
