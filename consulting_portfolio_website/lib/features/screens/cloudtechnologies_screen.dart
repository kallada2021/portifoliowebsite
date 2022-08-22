import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/constants/utils.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/techdescriptioncard.dart';
import 'package:flutter/material.dart';

import '../widgets/footer.dart';

class CloudTechnologiesScreen extends StatelessWidget {
  static const String routeName = "/cloudtechnologies";
  const CloudTechnologiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Scaffold(
      appBar: customAppBar(context),
      bottomSheet: const Footer(),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      size.width > 700
                          ? "Amazon Web Services (AWS)"
                          : "Amazon Web Services\n (AWS)",
                      style: GlobalVariables.kTechNameStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  // Add AWS ICON
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      "${GlobalVariables.s3Url}AWS.png",
                      fit: BoxFit.fill,
                    ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Azure Cloud",
                      style: GlobalVariables.kTechNameStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      "${GlobalVariables.s3Url}Azure.png",
                      fit: BoxFit.fill,
                    ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Terraform",
                      style: GlobalVariables.kTechNameStyle,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                        "${GlobalVariables.s3Url}TerraformLogo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: terraformIntro,
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
