import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      color: GlobalVariables.secondaryColor,
      child: Row(
        children: const [
          Center(
            child: Text("This is the footer"),
          )
        ],
      ),
    );
  }
}
