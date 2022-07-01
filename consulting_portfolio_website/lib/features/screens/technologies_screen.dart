import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/models/technology.dart';
import 'package:consulting_portfolio_website/features/screens/cloudtechnologies_screen.dart';
import 'package:consulting_portfolio_website/features/services/technology_service.dart';
import 'package:consulting_portfolio_website/features/widgets/technologycard.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

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
          Text("Our Technologies"),
          service.isLoading
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CircularProgressIndicator(
                    color: GlobalVariables.secondaryColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FutureBuilder<List<Technology>>(
                    future: getTech,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (ctx, int i) {
                            return Container(
                              width: 300,
                              color: Colors.transparent,
                              child: Center(
                                child: InkWell(
                                  enableFeedback: true,
                                  hoverColor: Colors.pink[100],
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
                          color: GlobalVariables.secondaryColor,
                        );
                      }
                    },
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
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context,MobileDevelopmentScreen.routename,);
                  },
                  child: TechnologyCard(
                    title: "Mobile Development",
                    techList: mobileDevelopmentTechnologies,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TechnologyCard(
                  title: "Web Development",
                  techList: webDevelopmentTechnologies,
                ),
                SizedBox(
                  height: 20,
                ),
                TechnologyCard(
                  title: "Devops",
                  techList: devopsTechnologies,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
