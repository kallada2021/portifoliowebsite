import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/techdescriptioncard.dart';
import 'package:flutter/material.dart';

import '../widgets/footer.dart';

class CloudTechnologiesScreen extends StatelessWidget {
  static const String routeName = "/cloudtechnologies";
  const CloudTechnologiesScreen({Key? key}) : super(key: key);

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
                "Cloud Technologies",
                style: GlobalVariables.kTechPageTitleStyle,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Amazon Web Services (AWS)",
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
                  descriptionText: amazonIntro,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Azure Cloud",
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
                  descriptionText: azureIntro,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Terraform",
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
                  descriptionText: terraformIntro,
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
