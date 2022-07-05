import 'package:consulting_portfolio_website/features/screens/intro_box.dart';
import 'package:consulting_portfolio_website/features/screens/projects_screen.dart';
import 'package:consulting_portfolio_website/features/screens/technologies_screen.dart';
import 'package:consulting_portfolio_website/features/services/technology_service.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/footer.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/global_variables.dart';
import '../widgets/appdrawer.dart';
import 'contactus.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const IntroBox(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Text(
                        "What we provide",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue[800],
                        ),
                      ),
                      const SizedBox(
                        height: GlobalVariables.lineHeight,
                      ),
                      Text("1. AWS"),
                      SizedBox(
                        height: GlobalVariables.lineHeight,
                      ),
                      Text("2. Azure"),
                    ],
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ContactUsScreen.routeName);
                    },
                    child: const Text("Contact Us"),
                  );
                },
              ),
              const SizedBox(
                height: GlobalVariables.lineHeight,
              ),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ProjectsScreen.routeName);
                    },
                    child: const Text(
                      "See our projects.",
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const TechnologiesScreen(),
              const SizedBox(
                height: 20,
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
