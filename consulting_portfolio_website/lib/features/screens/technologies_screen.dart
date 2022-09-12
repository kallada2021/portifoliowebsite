import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/models/technology.dart';
import 'package:consulting_portfolio_website/features/screens/cloudtechnologies_screen.dart';
import 'package:consulting_portfolio_website/features/screens/devops_screen.dart';
import 'package:consulting_portfolio_website/features/screens/webdev_technologies_screen.dart';
import 'package:consulting_portfolio_website/features/services/technology_service.dart';
import 'package:consulting_portfolio_website/features/widgets/loading_manager.dart';
import 'package:consulting_portfolio_website/features/widgets/technologycard.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'mobiledev_technologies_screen.dart';

class TechnologiesScreen extends StatefulWidget {
  const TechnologiesScreen({Key? key}) : super(key: key);

  @override
  State<TechnologiesScreen> createState() => _TechnologiesScreenState();
}

class _TechnologiesScreenState extends State<TechnologiesScreen> {
  late List<Technology> techList;
  late Future<List<Technology>> getTech;
  TechnologyService service = TechnologyService();

  Future<List<Technology>> getTechs() async {
    techList = await service.getTechs(context: context);
    if (techList.isEmpty) {
      return [];
    }
    techList.shuffle();
    setState(() {});
    return techList;
  }

  @override
  initState() {
    getTech = getTechs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: Colors.teal.shade50,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Some of our favorite technologies",
            style: TextStyle(
              color: Colors.deepPurple[900],
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          LoadingManager(
            isLoading: service.appState,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder<List<Technology>>(
                future: getTech,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: techList.isEmpty ? 0 : 4,
                      shrinkWrap: true,
                      itemBuilder: (ctx, int i) {
                        return Container(
                          width: 300,
                          color: Colors.transparent,
                          child: Center(
                            child: InkWell(
                              enableFeedback: true,
                              hoverColor: Colors.blue[100],
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("* ${snapshot.data![i].name}"),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return LoadingManager(
                        isLoading: service.appState,
                        child: Text('${snapshot.error}'));
                  } else {
                    // By default, show a loading spinner.
                    return CircularProgressIndicator(
                      color: GlobalVariables.kSecondaryColor,
                    );
                  }
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Scroll down for more technologies and information about our services",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: MediaQuery.of(context).size.width > 800
                ? const EdgeInsets.all(20.0)
                : const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CloudTechnologiesScreen.routeName,
                    );
                  },
                  child: TechnologyCard(
                    title: "Cloud Technologies",
                    techList: cloudTechnologies,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MobileDevTechnologiesScreen.routeName,
                    );
                  },
                  child: TechnologyCard(
                    title: "Mobile Development",
                    techList: mobileDevelopmentTechnologies,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      WebTechnologiesScreen.routeName,
                    );
                  },
                  child: TechnologyCard(
                    title: "Web Development",
                    techList: webDevelopmentTechnologies,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DevopsScreen.routeName,
                    );
                  },
                  child: TechnologyCard(
                    title: "Devops",
                    techList: devopsTechnologies,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
