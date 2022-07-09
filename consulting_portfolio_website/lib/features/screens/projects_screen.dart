import 'package:consulting_portfolio_website/features/models/projects.dart';
import 'package:consulting_portfolio_website/features/widgets/projectpage.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/global_variables.dart';
import 'contactus.dart';

class ProjectsScreen extends StatefulWidget {
  static const String routeName = "/projects";
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Center(
          child: Row(
            children: [
              Row(
                children: webHomeScreenItems,
              ),
              IconButton(
                  color: Colors.white,
                  tooltip: "Contact us",
                  onPressed: () {
                    print("Contact");
                    Navigator.pushNamed(context, ContactUsScreen.routeName);
                  },
                  icon: const Icon(Icons.email_outlined))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Project(
            title: "Living Well With Sickle Cell",
            description:
                "The Living Well with Sickle Cell phone application will allow patients who have sickle cell disease to better manage their daily lives.",
            imageURL:
                "https://portfolio-website-magnolia-bucket.s3.amazonaws.com/Images/LWSC.png",
          ),
          const Divider(
            color: Colors.pinkAccent,
          ),
          Project(
            title: "Project 2",
            description: "This is project 2.  This is description text",
          ),
          const Divider(
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}
