import 'dart:math';

import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/models/technology.dart';
import 'package:consulting_portfolio_website/features/screens/cloudtechnologies_screen.dart';
import 'package:consulting_portfolio_website/features/screens/devops_screen.dart';
import 'package:consulting_portfolio_website/features/screens/webdev_technologies_screen.dart';
import 'package:consulting_portfolio_website/features/services/technology_service.dart';
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
    techList.shuffle();
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
          SizedBox(
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
          service.isLoading
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CircularProgressIndicator(
                    color: GlobalVariables.kSecondaryColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FutureBuilder<List<Technology>>(
                    future: getTech,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // TODO: make random number not repetitive
                        //var index = Random();
                        return ListView.builder(
                          itemCount: 4,
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
                        return Text('${snapshot.error}');
                      } else {
                        // By default, show a loading spinner.
                        return CircularProgressIndicator(
                          color: GlobalVariables.kSecondaryColor,
                        );
                      }
                    },
                  ),
                ),
          const Text(
            "Scroll down for more technologies and information about our services",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: MediaQuery.of(context).size.width > 800
                ? const EdgeInsets.all(20.0)
                : const EdgeInsets.all(8.0),
            //TODO: Make card it's own dynamic widget and setup cards for other services
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  hoverColor: GlobalVariables.kLightBlue,
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
                  hoverColor: GlobalVariables.kLightBlue,
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
                  hoverColor: GlobalVariables.kLightBlue,
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
                  hoverColor: GlobalVariables.kLightBlue,
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
