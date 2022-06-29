import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: GlobalVariables.secondaryColor,
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
                  child: CircleAvatar(
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
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    "HOME",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.miscellaneous_services_sharp,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    "SERVICES",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                //not yet recieved
                ListTile(
                  leading: const Icon(
                    Icons.computer_sharp,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    "TECHNOLOGIES",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                // history
                ListTile(
                  leading: const Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    "SOLUTIONS",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                // Search
                ListTile(
                  leading: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    "CONTACT US",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  color: Colors.grey,
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
