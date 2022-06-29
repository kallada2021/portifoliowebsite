import 'package:consulting_portfolio_website/features/screens/intro_box.dart';
import 'package:consulting_portfolio_website/features/screens/projects_screen.dart';
import 'package:consulting_portfolio_website/features/screens/technologies_screen.dart';
import 'package:consulting_portfolio_website/features/services/technology_service.dart';
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
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Row(
                children: webHomeScreenItems,
              ),
              IconButton(
                  color: Colors.white,
                  tooltip: "Contact us",
                  onPressed: () {
                    print("Contact");
                    if (MediaQuery.of(context).size.width > 850) {
                      Navigator.pushNamed(
                        context,
                        ContactUsScreen.routeName,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        MobileContactScreen.routeName,
                      );
                    }
                  },
                  icon: const Icon(Icons.email_outlined))
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const IntroBox(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: const [
                      Text('What we provide'),
                      SizedBox(
                        height: GlobalVariables.lineHeight,
                      ),
                      Text("1. AWS"),
                      SizedBox(
                        height: GlobalVariables.lineHeight,
                      ),
                      Text("2. Azure"),
                      SizedBox(
                        height: GlobalVariables.lineHeight,
                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
