import 'package:consulting_portfolio_website/features/screens/intro_box.dart';
import 'package:consulting_portfolio_website/features/screens/projects_screen.dart';
import 'package:consulting_portfolio_website/features/screens/technologies_screen.dart';
import 'package:consulting_portfolio_website/features/services/technology_service.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../constants/global_variables.dart';
import 'contactus.dart';

class MainPage extends StatefulWidget {
  static String routeName = "/";
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List data = [
    {
      "title": "AWS",
      "url":
      "https://cdn.pixabay.com/photo/2020/11/08/09/41/deer-5723225_960_720.jpg"
    },
    {
      "title": "Azure",
      "url":
      "https://cdn.pixabay.com/photo/2020/11/01/19/41/autumn-5704791_960_720.jpg"
    },
    {
      "title": "Terraform",
      "url":
      "https://cdn.pixabay.com/photo/2020/04/11/14/55/houses-5030731_960_720.jpg"
    },
    {
      "title": "WebDevelopment",
      "url":
      "https://cdn.pixabay.com/photo/2020/11/16/16/05/hoverfly-5749361_960_720.jpg"
    },
    {
      "title": "MobileDevelopment",
      "url":
      "https://cdn.pixabay.com/photo/2020/04/19/12/26/thread-5063401_960_720.jpg"
    },
    {
      "title": "Devops",
      "url":
      "https://cdn.pixabay.com/photo/2020/11/16/22/58/mountains-5750804_960_720.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const IntroBox(),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 400),
              height: 300,
            ),
            items: data.map((item) {
              return GridTile(
                footer: Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.black54,
                    child: Text(
                      item["title"],
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.right,
                    )),
                child: Image.network(item["url"], fit: BoxFit.cover),
              );
            }).toList(),
          ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      // Text(
                      //   "What we provide",
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     color: Colors.blue[800],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: GlobalVariables.lineHeight,
                      // ),
                      // Text("1. Cloud Technologies"),
                      // SizedBox(
                      //   height: GlobalVariables.lineHeight,
                      // ),
                      // Text("2. Mobile Development"),
                      // SizedBox(
                      //   height: GlobalVariables.lineHeight,
                      // ),
                      // Text("3. Web Development"),
                      // SizedBox(
                      //   height:GlobalVariables.lineHeight,
                      // ),
                      // Text("4. Devops"),
                      // SizedBox(
                      //   height: GlobalVariables.lineHeight,
                      // ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ContactUsScreen.routeName);
                        },
                        child: const Text("Contact Us"),
                      );
                    },
                  ),
                  const SizedBox(
                    width: GlobalVariables.lineHeight,
                  ),
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ProjectsScreen.routeName);
                        },
                        child: const Text(
                          "See our projects.",
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              const TechnologiesScreen(),
              const SizedBox(
                height: 20,
              ),
              const Footer(),
            ],
          ),
        ),
      ),

    );
  }
}
