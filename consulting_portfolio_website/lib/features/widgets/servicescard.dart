import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  final String title, description, service;
  ServicesCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: GlobalVariables.kBorderColor,
          width: 3,
        ),
      ),
      child: Card(
        shadowColor: Colors.deepPurple[900],
        color: GlobalVariables.kGrayBackgroundColor,
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              service,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
