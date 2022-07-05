import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/features/widgets/techdescriptioncard.dart';
import 'package:flutter/material.dart';

import '../widgets/footer.dart';

class MobileDevTechnologiesScreen extends StatelessWidget {
  static const String routeName = "/mobiletechnologies";
  const MobileDevTechnologiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Mobile Technologies",
                style: TextStyle(
                  fontSize: 100,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Flutter",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.deepPurple[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  //TODO: ADD FLUTTER ICON
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red[300],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: flutterIntro,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swift (iOS)",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.deepPurple[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red[300],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: swiftIntro,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Kotlin (Android)",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.deepPurple[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  //TODO: Kotlin logo
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red[300],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: kotlinIntro,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}