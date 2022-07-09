import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/techdescriptioncard.dart';
import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import '../widgets/footer.dart';

class WebTechnologiesScreen extends StatelessWidget {
  static const String routeName = "/webtechnologies";
  const WebTechnologiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Web Technologies",
                style: GlobalVariables.kTechPageTitleStyle,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HTML/CSS",
                    style: GlobalVariables.kTechNameStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  // Add AWS ICON
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
                  descriptionText: htmlCssIntro,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Javascript",
                    style: GlobalVariables.kTechNameStyle,
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
                  descriptionText: javascriptInto,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Django",
                    style: GlobalVariables.kTechNameStyle,
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
                  descriptionText: djangoIntro,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "GoLang",
                    style: GlobalVariables.kTechNameStyle,
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
                  descriptionText: golangIntro,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "C#",
                    style: GlobalVariables.kTechNameStyle,
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
                  descriptionText: csharpIntro,
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
