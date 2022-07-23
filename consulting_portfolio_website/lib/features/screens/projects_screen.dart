import 'package:consulting_portfolio_website/features/models/projects.dart';
import 'package:consulting_portfolio_website/features/screens/main_page.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/projectpage.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/global_variables.dart';
import '../widgets/appdrawer.dart';
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
      drawer:
          MediaQuery.of(context).size.width > 1000 ? null : const AppDrawer(),
      appBar: customAppBar(context),
      bottomSheet: const Footer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Project(
              title: "Living Well With Sickle Cell",
              description:
                  "The Living Well with Sickle Cell phone application will allow patients who have sickle cell disease to better manage their daily lives.",
              imageURL: "${GlobalVariables.s3Url}LWSC.png",
            ),
            const Divider(
              color: Colors.pinkAccent,
            ),
            Project(
              title: "Ecommerce App",
              description: "A full stack ecommerce app.",
            ),
          ],
        ),
      ),
    );
  }
}
