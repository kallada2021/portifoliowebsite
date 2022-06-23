import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import 'contactus.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: const [
                Text('What we provide'),
                SizedBox(
                  height: GlobalVariables.lineHeight,
                ),
                Text("1. AWS"),
                SizedBox(
                  height: GlobalVariables.lineHeight,
                ),
                Text("2. Azure"),
                SizedBox(
                  height: GlobalVariables.lineHeight,
                ),
              ],
            ),
          ),
        ),
        Builder(builder: (context) {
          return ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ContactUsScreen.routeName);
              },
              child: const Text("Contact Us"));
        })
      ],
    );
  }
}
