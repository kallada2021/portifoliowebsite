import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/constants/utils.dart';
import 'package:consulting_portfolio_website/features/screens/contactus.dart';
import 'package:consulting_portfolio_website/features/screens/main_page.dart';
import 'package:consulting_portfolio_website/features/screens/meet_the_team.dart';
import 'package:consulting_portfolio_website/features/screens/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Container(
      width: double.infinity,
      height: 100.0,
      color: GlobalVariables.kSecondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.canPop(context);
                }
                Navigator.pushNamed(
                  context,
                  MainPage.routeName,
                );
              },
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
                        if (Navigator.canPop(context)) {
                          Navigator.canPop(context);
                        }
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
                        if (Navigator.canPop(context)) {
                          Navigator.canPop(context);
                        }
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
                  size.width > 900
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                              if (Navigator.canPop(context)) {
                                Navigator.canPop(context);
                              }
                              Navigator.pushNamed(
                                context,
                                MeetTheTeamScreen.routeName,
                              );
                            },
                            child: Row(
                              children: const [
                                Text(
                                  "Meet The Team",
                                  style: GlobalVariables.kFooterTextStyle,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  IconlyBold.user2,
                                  color: Colors.white60,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
