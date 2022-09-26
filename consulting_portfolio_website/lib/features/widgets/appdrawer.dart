import 'dart:io';

import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/contactus.dart';
import 'package:consulting_portfolio_website/features/screens/meet_the_team.dart';
import 'package:consulting_portfolio_website/features/screens/projects_screen.dart';
import 'package:consulting_portfolio_website/features/screens/services_screen.dart';
import 'package:flutter/material.dart';

import '../screens/main_page.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: GlobalVariables.kSecondaryColor,
      child: ListView(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.only(top: 26, bottom: 13),
            child: Column(
              children: const [
                // user profile image
                SizedBox(
                  height: 130,
                  width: 130,
                  //TODO: add company logo image
                  // child: CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   backgroundImage: NetworkImage(""),
                  // ),
                ),
                //username
                SizedBox(
                  height: 12,
                ),
                Text(
                  "MAGNOLIA CONSULTING",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          // body
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                const Divider(
                  height: 10,
                  color: Colors.white,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "HOME",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                    Navigator.pushNamed(
                      context,
                      MainPage.routeName,
                    );
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.white,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.miscellaneous_services_sharp,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "SERVICES",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ServicesScreen.routeName,
                    );
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.white,
                  thickness: 2,
                ),
                //not yet received
                ListTile(
                  leading: const Icon(
                    Icons.computer_sharp,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "PROJECTS",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProjectsScreen.routeName,
                    );
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.white,
                  thickness: 2,
                ),
                // Search
                ListTile(
                  leading: const Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "CONTACT US",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ContactUsScreen.routeName,
                    );
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.white,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.people_outline_sharp,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "MEET THE TEAM",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MeetTheTeamScreen.routeName,
                    );
                  },
                ),
                const Divider(
                  height: 10,
                  color: Colors.white,
                  thickness: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
