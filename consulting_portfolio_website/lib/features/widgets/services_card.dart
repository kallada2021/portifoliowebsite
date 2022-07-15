import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  final String title,description;
  ServicesCard({Key? key,required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight:FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
              description,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
        ],
      ) ,
    );
  }
}

