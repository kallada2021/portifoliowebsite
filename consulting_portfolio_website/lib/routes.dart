import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/cloudtechnologies_screen.dart';
import 'package:consulting_portfolio_website/features/screens/contactus.dart';
import 'package:consulting_portfolio_website/features/screens/devops_screen.dart';
import 'package:consulting_portfolio_website/features/screens/mobiledev_technologies_screen.dart';
import 'package:consulting_portfolio_website/features/screens/projects_screen.dart';
import 'package:consulting_portfolio_website/features/screens/services_screen.dart';
import 'package:consulting_portfolio_website/features/screens/webdev_technologies_screen.dart';
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
    case MobileDevTechnologiesScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MobileDevTechnologiesScreen(),
      );
    case DevopsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DevopsScreen(),
      );
    case WebTechnologiesScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WebTechnologiesScreen(),
      );
    case ServicesScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ServicesScreen(),
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
                color: GlobalVariables.kSecondaryColor,
              ),
            ),
          ),
        ),
      );
  }
}
