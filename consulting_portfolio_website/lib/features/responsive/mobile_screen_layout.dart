import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/intro_box.dart';
import 'package:consulting_portfolio_website/features/widgets/appdrawer.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import '../screens/contactus.dart';
import '../screens/projects_screen.dart';
import '../screens/technologies_screen.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: customAppBar(context),
      // appBar: AppBar(
      //   elevation: 2.0,
      //   title: Text("MAGNOLIA CONSULTING"),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const IntroBox(),
              Text(
                "Mobile Screen",
                style: TextStyle(
                  color: GlobalVariables.kSecondaryColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) {
                      return SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ContactUsScreen.routeName);
                          },
                          child: const Text("Contact Us"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: GlobalVariables.lineHeight,
                  ),
                  Builder(
                    builder: (context) {
                      return SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ProjectsScreen.routeName);
                          },
                          child: const Text(
                            "Our projects.",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const TechnologiesScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
