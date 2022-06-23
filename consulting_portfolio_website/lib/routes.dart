import 'package:consulting_portfolio_website/features/screens/contactus.dart';
import 'package:consulting_portfolio_website/features/screens/projects_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ContactUsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ContactUsScreen(),
      );
    case ProjectsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProjectsScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Sorry, The page you are looking for does not exist."),
          ),
        ),
      );
  }
}
