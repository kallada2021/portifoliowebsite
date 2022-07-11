import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/contactus.dart';
import 'package:consulting_portfolio_website/features/screens/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      color: GlobalVariables.kSecondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "About",
                        style: GlobalVariables.kFooterTextStyle,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        IconlyBold.infoCircle,
                        color: Colors.white60,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ContactUsScreen.routeName);
                    },
                    child: Row(
                      children: const [
                        Text(
                          "Contact us",
                          style: GlobalVariables.kFooterTextStyle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          IconlyBold.message,
                          color: Colors.white60,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ServicesScreen.routeName,
                      );
                    },
                    child: Row(
                      children: const [
                        Text(
                          "Services",
                          style: GlobalVariables.kFooterTextStyle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          IconlyBold.chart,
                          color: Colors.white60,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
