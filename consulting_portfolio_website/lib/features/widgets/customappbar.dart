import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../constants/constants.dart';
import '../screens/contactus.dart';
import '../screens/projects_screen.dart';
import '../screens/services_screen.dart';

//TODO: Build Mobile AppBar
AppBar customAppBar(BuildContext context) {
  Size size = Utils(context).screenSize;
  return size.width > 1050
      ? AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: GlobalVariables.lineWidth,
                    ),
                    const Text(
                      "MAGNOLIA IT SOLUTIONS",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                     SizedBox(
                      width: size.width*0.2,
                    ),
                    const SizedBox(
                      width: GlobalVariables.lineWidth,
                    ),
                    SizedBox(
                      // width: 270,
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, ServicesScreen.routeName);
                        },
                        child: Text("Services", style: GlobalVariables.kAppBarTextStyle,),
                      ),
                    ),
                    const SizedBox(
                      width: GlobalVariables.lineWidth,
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, ProjectsScreen.routeName);
                        },
                        child: Text("Projects", style: GlobalVariables.kAppBarTextStyle,),
                    ),
                    const SizedBox(
                      width: GlobalVariables.lineWidth,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Contact us",style: GlobalVariables.kAppBarTextStyle,),
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
