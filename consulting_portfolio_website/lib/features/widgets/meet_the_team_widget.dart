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
        child: Material(
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  nameText,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
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
    );
  }
}
