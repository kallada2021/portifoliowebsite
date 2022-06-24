import 'package:consulting_portfolio_website/features/models/projects.dart';
import 'package:consulting_portfolio_website/features/screens/project_widget.dart';
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
    // return Center(
    //   child: IconButton(
    //     icon: const Icon(Icons.computer_sharp),
    //     onPressed: () {},
    //   ),
    // );
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
        children: const [
          Project(
            title: "Project 1",
            description: "This is project 1.  This is description text",
          ),
          Divider(
            color: Colors.pinkAccent,
          ),
          Project(
            title: "Project 2",
            description: "This is project 2.  This is description text",
          ),
          Divider(
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}
