import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import '../widgets/servicescard.dart';

class WebDevServicesScreen extends StatelessWidget {
  WebDevServicesScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> serviceInfo = [
    {
      "service": "Web Development",
      "title": "HTML/CSS",
      "description":
          "Create a website using HTML5 and style the website using CSS."
    },
    {
      "service": "Web Development",
      "title": "JavaScript",
      "description":
          "Create a functional/responsive website using a Javascript framework such as React.Js/Angular/Vue.",
    },
    {
      "service": "Web Development",
      "title": "RESTFUL Services",
      "description":
          "Create a RESTFUL API to update interact with databases/other systems.",
    },
    {
      "service": "Web Development",
      "title": "Microservices",
      "description":
          "Replace Monolithic services with several smaller services(i.e logging,payment,userInfo etc.)."
    },
    {
      "service": "Web Development",
      "title": "Full Stack",
      "description":
          "Create a fully functional app with the above mentioned front end, backend and deploy to a cloud provider(AWS/Azure) using Devops."
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
                        screenWidth > 1200 ? 240 / 150 : 200 / 120,
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
