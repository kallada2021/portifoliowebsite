import 'package:consulting_portfolio_website/features/screens/projects_screen.dart';
import 'package:consulting_portfolio_website/features/services/technology_service.dart';
import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
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
  void initState() {
    TechnologyService service = TechnologyService();
    service.getTechs(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              child: Text(
                "See our projects.",
              ),
            );
          },
        )
      ],
    );
  }
}
