import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:flutter/material.dart';

linearProgressBar() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 15),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        GlobalVariables.kSecondaryColor,
      ),
    ),
  );
}
