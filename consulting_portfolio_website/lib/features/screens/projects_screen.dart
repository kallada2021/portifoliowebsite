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
  List<Projects> projects = [];
  getProjects() async {
    projects = await ProjectsService.getProjects(context: context);
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
            // Project(
            //   title: "Living Well With Sickle Cell",
            //   description:
            //       "The Living Well with Sickle Cell phone application will allow patients who have sickle cell disease to better manage their daily lives.",
            //   imageURL: "${GlobalVariables.s3Url}LWSC.png",
            // ),
            // const Divider(
            //   color: Colors.pinkAccent,
            // ),
            projects.isEmpty
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
