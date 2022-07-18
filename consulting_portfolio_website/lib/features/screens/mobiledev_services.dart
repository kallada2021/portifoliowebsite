import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import '../widgets/servicescard.dart';

class MobileServicesScreen extends StatelessWidget {
  MobileServicesScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> serviceInfo = [
    {
      "service": "Mobile Development",
      "title": "Android App",
      "description":
          "Create an Android app backed by a Django or DotNet Core API and Postgres/firebase/Azure SQl database hosted on the cloud using Flutter or native Kotlin for the app. The app will be deployed to the Google Playstore."
    },
    {
      "service": "Mobile Development",
      "title": "iOS App",
      "description":
          "Create an iOS app backed by a Django or DotNet Core API and Postgres/Azure SQL  database hosted on the cloud using Flutter or native SwiftUI for the app. The app will be deployed to the Apple Store.",
    },
    {
      "service": "Mobile Development",
      "title": "Cross Platform App",
      "description":
          "Create a cross platform app with the same code base using Flutter and a cloud based API and deploy it to the Google and Apple App stores. Website or Desktop app also available.",
    },
    {
      "service": "Mobile Development",
      "title": "App Migration",
      "description":
          "Migrate an existing app to be cross platform or to use an API or create an App for an existing backend and website."
    },
    {
      "service": "Mobile Development",
      "title": "API Development",
      "description":
          "Create an API using Golang, Django or Dotnet Core for a mobile application and integrate with payment services(i.e Google/Apple pay or Stripe)"
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
