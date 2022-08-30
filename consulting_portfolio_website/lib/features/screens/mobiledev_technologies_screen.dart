import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/techdescriptioncard.dart';
import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import '../widgets/footer.dart';

class MobileDevTechnologiesScreen extends StatelessWidget {
  static const String routeName = "/mobile-technologies";

  const MobileDevTechnologiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      bottomSheet: const Footer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Mobile Technologies",
                style: GlobalVariables.kTechPageTitleStyle,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Flutter",
                    style: GlobalVariables.kTechNameStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      "${GlobalVariables.s3Url}FlutterLogo.png",
                      fit: BoxFit.fill,
                    ),
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
                    style: GlobalVariables.kTechNameStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network("${GlobalVariables.s3Url}iOSLogo.png",
                        fit: BoxFit.fill),
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
                    style: GlobalVariables.kTechNameStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  //TODO: Kotlin logo
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network("${GlobalVariables.s3Url}Android.png",
                        fit: BoxFit.fill),
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
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
