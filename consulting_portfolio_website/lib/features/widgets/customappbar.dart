import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../screens/contactus.dart';

//TODO: Build Mobile AppBar
AppBar customAppBar(BuildContext context) {
  return AppBar(
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
                print("Contact");
                if (MediaQuery.of(context).size.width > 850) {
                  Navigator.pushNamed(
                    context,
                    ContactUsScreen.routeName,
                  );
                } else {
                  Navigator.pushNamed(
                    context,
                    MobileContactScreen.routeName,
                  );
                }
              },
              icon: const Icon(Icons.email_outlined))
        ],
      ),
    ),
  );
}
