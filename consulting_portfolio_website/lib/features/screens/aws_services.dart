import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/global_variables.dart';
import '../widgets/servicescard.dart';

class AWSServicesScreen extends StatelessWidget {
  AWSServicesScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> serviceInfo = [
    {
      "service": "AWS",
      "title": "EC2",
      "description":
          "Deploy your application to a customizable EC2 virtual machine instance and integrate it with other AWS infrastructure."
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
      "description":
          "Lambdas can be created as Python, Javascript or Golang code as a serverless API and run when invoked by another AWS resource or outside application saving you costs and time.",
    },
    {
      "service": "AWS",
      "title": "EKS Kubernetes",
      "description":
          "Deploy an application or microservice with load balancing and routing to a scalable managed Kubernetes cluster.",
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Text(
          "Our Services",
          style: GlobalVariables.kTechPageTitleStyle,
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Divider(
            color: Colors.teal,
            height: 2,
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: screenWidth > webScreenSize
                ? GridView.count(
                    crossAxisCount: screenWidth > 1080 ? 3 : 2,
                    childAspectRatio:
                        screenWidth > 1200 ? 240 / 160 : 200 / 120,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: List.generate(
                      serviceInfo.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ServicesCard(
                            title: serviceInfo[index]["title"],
                            description: serviceInfo[index]["description"],
                            service: serviceInfo[index]["service"],
                          ),
                        );
                      },
                    ),
                  )
                : GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 240 / 100,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: List.generate(
                      serviceInfo.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ServicesCard(
                            title: serviceInfo[index]["title"],
                            description: serviceInfo[index]["description"],
                            service: serviceInfo[index]["service"],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
