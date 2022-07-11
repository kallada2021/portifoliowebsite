import 'package:consulting_portfolio_website/features/models/projects.dart';
import 'package:consulting_portfolio_website/features/screens/main_page.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/projectpage.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/global_variables.dart';
import '../widgets/footer.dart';
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
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Project(
              title: "Living Well With Sickle Cell",
              description:
                  "The Living Well with Sickle Cell phone application will allow patients who have sickle cell disease to better manage their daily lives.",
              imageURL:
                  "https://testing-portfolio-website-magnolia-bucket.s3.amazonaws.com/Images/LWSC.png",
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
            const Footer(),
          ],
        ),
      ),
    );
  }
}
