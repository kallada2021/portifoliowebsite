import 'package:consulting_portfolio_website/features/screens/projectpictures_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class Project extends StatelessWidget {
  final String title;
  final String description;
  String? imageURL;

  Project({
    Key? key,
    required this.title,
    required this.description,
    this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context,ProjectPicture.routeName,arguments: ProjectPicture(
                    imageUrl: imageURL,
                  ),
                  );
                },
                child: SizedBox(
                  height: 500,
                  width: 500,
                  child:
                      imageURL != null ? Image.network(imageURL!) : Container(),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: GlobalVariables.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        style: TextStyle(color: GlobalVariables.secondaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
