import 'package:flutter/material.dart';

class ProjectsScreen extends StatefulWidget {
  static const String routeName = "/projects";
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.computer_sharp),
        onPressed: () {},
      ),
    );
  }
}
