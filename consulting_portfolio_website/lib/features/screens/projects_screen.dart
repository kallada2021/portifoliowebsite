import 'dart:developer';

import 'package:consulting_portfolio_website/constants/utils.dart';
import 'package:consulting_portfolio_website/features/models/projects.dart';
import 'package:consulting_portfolio_website/features/services/projects_service.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/projectpage.dart';
import 'package:flutter/material.dart';
import '../../constants/global_variables.dart';
import '../widgets/appdrawer.dart';
import '../widgets/footer.dart';

class ProjectsScreen extends StatefulWidget {
  static const String routeName = "/projects";
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String errorMsg = "";
  bool isError = false;
  List<Projects> projects = [];

  getProjects() async {
    try {
      projects = await ProjectsService.getProjects(context: context);
    } catch (error) {
      log("error $error");
      isError = true;
      errorMsg = "Oops! We are having problems reaching our servers.";
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    getProjects();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Scaffold(
      drawer: size.width > 1000.0 ? null : const AppDrawer(),
      appBar: customAppBar(context),
      bottomSheet: const Footer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            isError
                ? Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: Text(
                        errorMsg,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                : projects.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: GlobalVariables.kSecondaryColor,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: double.infinity,
                        height: size.height,
                        child: ListView.builder(
                          itemCount: projects.length,
                          itemBuilder: (ctx, index) {
                            return Project(
                              title: projects[index].name,
                              description: projects[index].description,
                              imageURL: projects[index].imageUrl,
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
