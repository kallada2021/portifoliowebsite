import 'dart:io';

import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/contactus.dart';
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
              children: [
                // user profile image
                Container(
                  height: 130,
                  width: 130,
                  //TODO: add company logo image
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(""),
                  ),
                ),
                //username
                const SizedBox(
                  height: 12,
                ),
                const Text(
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
                    "TECHNOLOGIES",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {},
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
