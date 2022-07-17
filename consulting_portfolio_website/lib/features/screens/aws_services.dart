import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import '../widgets/services_card.dart';

class AWSServicesScreen extends StatelessWidget {
  AWSServicesScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> serviceInfo = [
    {
      "service": "AWS",
      "title": "EC2",
      "description":
          "Deploy an application to a Linux or Windows EC2 virtual server with a custom VPC, Subnets, Security Groups, Routetables as well as Autoscaling, and a custom launch template backed by an Application Load Balancer.."
    },
    {
      "service": "AWS",
      "title": "Managed Active Directory",
      "description":
          "AWS Managed Active Directory with logging and schemas, custom security groups, AWS Secret Manager password rotation and domain joins.",
    },
    {
      "service": "AWS",
      "title": "Lambdas",
      "description": "Serverless lambda",
    },
    {
      "service": "AWS",
      "title": "EKS Kubernetes",
      "description":
          "Deploy an application to a scalable managed Kubernetes cluster.",
    },
    {
      "service": "AWS",
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
                        _screenWidth > 1200 ? 240 / 120 : 200 / 90,
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
