import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/footer.dart';
import 'package:consulting_portfolio_website/features/widgets/techdescriptioncard.dart';
import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class DevopsScreen extends StatelessWidget {
  static const String routeName = "/devops-technologies";

  const DevopsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      bottomSheet: const Footer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                "Devops TechStack",
                style: GlobalVariables.kTechPageTitleStyle,
                textAlign: TextAlign.center,
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
                    width: 15.0,
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: terraformIntro,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Azure Devops",
                    style: GlobalVariables.kTechNameStyle,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      "${GlobalVariables.s3Url}AzureDevOps.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: azureDevopsIntro,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Jenkins",
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
                      "${GlobalVariables.s3Url}Jenkins.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: jenkinsIntro,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AWS CDK",
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
                      "${GlobalVariables.s3Url}AWS.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: cdkIntro,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Kubernetes",
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
                      "${GlobalVariables.s3Url}kubernetes.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: kubernetesIntro,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Github Actions",
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
                      "${GlobalVariables.s3Url}Github.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: githubActionsIntro,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PowerShell",
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
                      "${GlobalVariables.s3Url}PowershellLogo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: powershellIntro,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Docker",
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
                      "${GlobalVariables.s3Url}Docker.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TechDescriptionCard(
                  descriptionText: dockerIntro,
                ),
              ),
              const SizedBox(
                height: 150.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
