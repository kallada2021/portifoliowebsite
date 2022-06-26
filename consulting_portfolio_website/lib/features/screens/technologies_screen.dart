import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/services/technology_service.dart';
import 'package:flutter/material.dart';

class TechnologiesScreen extends StatefulWidget {
  const TechnologiesScreen({Key? key}) : super(key: key);

  @override
  State<TechnologiesScreen> createState() => _TechnologiesScreenState();
}

class _TechnologiesScreenState extends State<TechnologiesScreen> {
  var techList;
  TechnologyService service = TechnologyService();
  @override
  void initState() {
    techList = service.getTechs(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                child: Text(techList.toString()),
              ),
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
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Cloud Technologies",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
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
    );
  }
}
