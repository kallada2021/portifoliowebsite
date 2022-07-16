import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import '../widgets/services_card.dart';

class AzureServicesScreen extends StatelessWidget {
  AzureServicesScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> serviceInfo = [
    {
      "service": "Azure",
      "title": "AKS",
      "description":
          "Deploy a Kubernetes application to a Linux or Windows virtual cluster with a custom network, security groups, Routetables as well as Autoscaling, and backed by an Application Load Balancer.."
    },
    {
      "service": "Azure",
      "title": "Azure Active Directory",
      "description":
          "AWS Managed Active Directory with logging and schemas, custom security groups, AWS Secret Manager password rotation and domain joins.",
    },
    {
      "service": "Azure",
      "title": "Azure Functions",
      "description": "Serverless lambda",
    },
    {
      "service": "Azure",
      "title": "Cloudwatch Dashboards",
      "description":
          "Monitor your application with customized Cloudwatch dashboards for easy logging."
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
