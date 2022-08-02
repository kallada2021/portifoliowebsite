import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/intro_box.dart';
import 'package:consulting_portfolio_website/features/widgets/appdrawer.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import '../screens/contactus.dart';
import '../screens/projects_screen.dart';
import '../screens/services_screen.dart';
import '../screens/technologies_screen.dart';
import '../widgets/footer.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: customAppBar(context),
      bottomSheet: const Footer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
                child: IntroBox(),
              ),
              const SizedBox(
                height: GlobalVariables.kLineHeight,
              ),
              Column(
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
                          child: const Text("Featured Services"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: GlobalVariables.kLineHeight,
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
                            "Current Projects",
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: GlobalVariables.kLineHeight,
                  ),
                  Builder(
                    builder: (context) {
                      return SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ServicesScreen.routeName);
                          },
                          child: const Text("Contact us"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: GlobalVariables.kLineHeight,
                  ),
                ],
              ),
              const TechnologiesScreen(),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
