import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class TechnologyCard extends StatelessWidget {
  final String title;
  final List<String> techList;
  final double height;

  const TechnologyCard({
    Key? key,
    required this.title,
    required this.techList,
    this.height = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.15),
        color: Colors.red[200],
        shadowColor: GlobalVariables.secondaryColor,
        elevation: 12,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
              width: 3.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(7.0),
            ),
          ),
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
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (String tech in techList)
                      Text(
                        tech,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Colors.black87,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
