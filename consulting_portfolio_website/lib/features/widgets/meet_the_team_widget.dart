import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:flutter/material.dart';

class MeetTheTeamWidget extends StatelessWidget {
  final String nameText;
  final String descriptionText;
  const MeetTheTeamWidget({
    Key? key,
    required this.nameText,
    required this.descriptionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: GlobalVariables.kCardBackgroundColor,
        child: Material(
          color: GlobalVariables.kCardBackgroundColor,
          child: InkWell(
            hoverColor: Colors.purple[200]!.withOpacity(0.8),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Divider(
                    thickness: 2,
                    height: 3,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    nameText,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    descriptionText,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                    height: 3,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
