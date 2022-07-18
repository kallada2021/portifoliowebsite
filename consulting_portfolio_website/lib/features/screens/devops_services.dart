import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import '../widgets/servicescard.dart';

class DevopsServicesScreen extends StatelessWidget {
  DevopsServicesScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> serviceInfo = [
    {
      "service": "Devops",
      "title": "Terraform",
      "description":
          "Cloud Agnostic Infrastructure as Code, Terraform allows for efficient and organized cloud deployments."
    },
    {
      "service": "Devops",
      "title": "Jenkins",
      "description":
          "Jenkins pipelines organizes deployments and allows easy multiplatform or multi environment deployments.",
    },
    {
      "service": "Devops",
      "title": "Github Actions",
      "description": "Github Actions sets up pipelines for easy deployment.",
    },
    {
      "service": "Devops",
      "title": "Azure Devops",
      "description":
          "Deploy a Web/mobile application and infrastructure  using Azure Devops(Self-hosted agent/MS Hosted Agent)."
    },
    {
      "service": "Devops",
      "title": "Linux/Shell Scripting",
      "description":
          "Customize deployed infrastructure/applications by using userdata/artifacts file on AWS/Azure."
    },
    {
      "service": "Devops",
      "title": "Packer",
      "description":
      "Prepare a customized image for your business needs and deploy to AWS/Azure image galleries which can be used while provisioning resources on Cloud/On-Prem."
    },
    {
      "service": "Devops",
      "title": "PowerShell",
      "description":
          "Build, deploy and manage web apps using your choice of programming language(.Net, Flutter, Python, Next.js). Integrate with any source control. "
    }
  ];

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Text(
          "Our Services",
          style: GlobalVariables.kTechPageTitleStyle,
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: _screenWidth > 700
                ? GridView.count(
                    crossAxisCount: _screenWidth > 1080 ? 3 : 2,
                    childAspectRatio:
                        _screenWidth > 1200 ? 240 / 100 : 200 / 90,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: List.generate(serviceInfo.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ServicesCard(
                          title: serviceInfo[index]["title"],
                          description: serviceInfo[index]["description"],
                          service: serviceInfo[index]["service"],
                        ),
                      );
                    }),
                  )
                : GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 240 / 70,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: List.generate(serviceInfo.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ServicesCard(
                          title: serviceInfo[index]["title"],
                          description: serviceInfo[index]["description"],
                          service: serviceInfo[index]["service"],
                        ),
                      );
                    }),
                  ),
          ),
        ),
      ],
    );
  }
}
