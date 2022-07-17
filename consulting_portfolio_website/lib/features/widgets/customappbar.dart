import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../constants/constants.dart';
import '../screens/contactus.dart';

//TODO: Build Mobile AppBar
AppBar customAppBar(BuildContext context) {
  Size size = Utils(context).screenSize;
  return size.width > 1050
      ? AppBar(
          title: Center(
            child: Row(
              children: [
                Row(
                  children: webHomeScreenItems,
                ),
                IconButton(
                  color: Colors.white,
                  tooltip: "Contact us",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ContactUsScreen.routeName,
                    );
                  },
                  icon: const Icon(IconlyBold.message),
                ),
              ],
            ),
          ),
        )
      : AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("MAGNOLIA IT CONSULTING"),
                const SizedBox(
                  width: GlobalVariables.lineHeight,
                ),
                IconButton(
                  color: Colors.white,
                  tooltip: "Contact us",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ContactUsScreen.routeName,
                    );
                  },
                  icon: const Icon(IconlyBold.message),
                ),
              ],
            ),
          ),
        );
}
