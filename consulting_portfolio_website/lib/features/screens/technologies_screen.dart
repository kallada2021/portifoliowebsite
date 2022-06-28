import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/models/technology.dart';
import 'package:consulting_portfolio_website/features/services/technology_service.dart';
import 'package:flutter/material.dart';

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
                  )),
          Padding(
            padding: const EdgeInsets.all(30.0),
            //TODO: Make card it's own dynamic widget and setup cards for other services
            child: Container(
              height: 150,
              child: Card(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                color: Colors.red[200],
                shadowColor: GlobalVariables.secondaryColor,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      "Cloud Technologies",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Terraform"),
                          Text("Github Actions"),
                          Text("Bash Scripting"),
                          Text("Jenkins"),
                          Text("Kubernetes"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
