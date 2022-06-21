import 'package:consulting_portfolio_website/features/screens/contactus.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ContactUsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ContactUsScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
              child:
                  Text("Sorry, The page you are looking for does not exist.")),
        ),
      );
  }
}
