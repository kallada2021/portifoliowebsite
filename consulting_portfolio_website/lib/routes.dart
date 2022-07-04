import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/cloudtechnologies_screen.dart';
import 'package:consulting_portfolio_website/features/screens/contactus.dart';
import 'package:consulting_portfolio_website/features/screens/devops_screen.dart';
import 'package:consulting_portfolio_website/features/screens/projects_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ContactUsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ContactUsScreen(),
      );
    case MobileContactScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MobileContactScreen(),
      );
    case ProjectsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProjectsScreen(),
      );
    case CloudTechnologiesScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CloudTechnologiesScreen(),
      );
    case DevopsScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DevopsScreen(),
  );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              "Sorry, The page you are looking for does not exist.",
              style: TextStyle(
                fontSize: 20,
                color: GlobalVariables.secondaryColor,
              ),
            ),
          ),
        ),
      );
  }
}
