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
        color: Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.teal.withOpacity(0.7),
          width: 3,
        ),
      ),
      child: Card(
        shadowColor: Colors.teal[900],
        color: Theme.of(context).cardColor,
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
