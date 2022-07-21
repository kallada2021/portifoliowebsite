import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import '../widgets/servicescard.dart';

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
          "Azure AD is an identity service that provides SSO, MFA and Conditional Access to guards against cyber attacks.",
    },
    {
      "service": "Azure",
      "title": "Azure Functions",
      "description":
          "Serverless function which can be written in C#, Python, GoLang",
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
            child: screenWidth > 700
                ? GridView.count(
                    crossAxisCount: screenWidth > 1080 ? 3 : 2,
                    childAspectRatio:
                        screenWidth > 1200 ? 240 / 140 : 200 / 120,
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
                    childAspectRatio: 240 / 100,
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
