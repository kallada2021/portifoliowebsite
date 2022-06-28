import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class TechnologyCard extends StatelessWidget {
  final String title;
  final List<String> techList;
  const TechnologyCard({Key? key, required this.title, required this.techList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text(
              title,
              style: const TextStyle(
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
                  for(String tech in techList)
                    Text(tech),
                   // Text("Terraform"),
                  // Text("Github Actions"),
                  // Text("Bash Scripting"),
                  // Text("Jenkins"),
                  // Text("Kubernetes"),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
