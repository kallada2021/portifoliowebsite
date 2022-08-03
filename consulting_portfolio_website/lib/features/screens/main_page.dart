import 'package:consulting_portfolio_website/constants/utils.dart';
import 'package:consulting_portfolio_website/features/screens/intro_box.dart';
import 'package:consulting_portfolio_website/features/screens/meet_the_team.dart';
import 'package:consulting_portfolio_website/features/screens/projects_screen.dart';
import 'package:consulting_portfolio_website/features/screens/services_screen.dart';
import 'package:consulting_portfolio_website/features/screens/technologies_screen.dart';
import 'package:consulting_portfolio_website/features/services/technology_service.dart';
import 'package:consulting_portfolio_website/features/widgets/appdrawer.dart';
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
    {"title": "AWS", "url": "${GlobalVariables.s3Url}FullStackOnAWS.png"},
    {
      "title": "Azure",
      "url": "${GlobalVariables.s3Url}AzureWebApp.JPG",
    },
    {
      "title": "Terraform",
      "url": "${GlobalVariables.s3Url}terraform.png",
    },
    {
      "title": "WebDevelopment",
      "url": "${GlobalVariables.s3Url}EcommerceWebsite.png",
    },
    {
      "title": "MobileDevelopment",
      "url": "${GlobalVariables.s3Url}LWSC.png",
    },
    {
      "title": "Devops",
      "url":
          "https://cdn.pixabay.com/photo/2020/11/16/22/58/mountains-5750804_960_720.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Scaffold(
      drawer: size.width > 1000 ? null : const AppDrawer(),
      appBar: customAppBar(context),
      bottomSheet: const Footer(),
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
                  height: 400,
                ),
                items: data.map((item) {
                  return GridTile(
                    footer: Container(
                        padding: const EdgeInsets.all(15),
                        color: Colors.black54,
                        child: Text(
                          item["title"],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.right,
                        )),
                    child: Image.network(item["url"], fit: BoxFit.cover),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                      builder: (context) {
                        return SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                MeetTheTeamScreen.routeName,
                              );
                            },
                            child: const Text("Meet the team"),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                      builder: (context) {
                        return SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ServicesScreen.routeName);
                            },
                            child: const Text("Featured Services"),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                      builder: (context) {
                        return SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ProjectsScreen.routeName);
                            },
                            child: const Text(
                              "Current Projects",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                      builder: (context) {
                        return SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ContactUsScreen.routeName);
                            },
                            child: const Text("Contact Us"),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: GlobalVariables.kLineHeight,
              ),
              const SizedBox(
                width: GlobalVariables.kLineHeight,
              ),
              const SizedBox(
                width: GlobalVariables.kLineHeight,
              ),
              const SizedBox(
                height: 50,
              ),
              const TechnologiesScreen(),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
