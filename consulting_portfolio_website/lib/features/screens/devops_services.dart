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
      "service": "Azure",
      "title": "Kubernetes AKS",
      "description":
          "Deploy a Kubernetes cluster to Azure AKS, a scalable managed Kubernetes service."
    },
    {
      "service": "Azure",
      "title": "Log Analytics Dashboards",
      "description":
          "Monitor your application with customized Log Analytics dashboards built using Kusto Query Language(KQL)."
    },
    {
      "service": "Azure",
      "title": "Azure Web Apps",
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
