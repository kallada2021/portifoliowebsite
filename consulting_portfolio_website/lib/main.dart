import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/responsive/mobile_screen_layout.dart';
import 'package:consulting_portfolio_website/features/responsive/responsive_layout.dart';
import 'package:consulting_portfolio_website/features/screens/contactus.dart';
import 'package:consulting_portfolio_website/features/widgets/custombutton.dart';
import 'package:consulting_portfolio_website/routes.dart';
import 'package:flutter/material.dart';

import 'features/screens/main_page.dart';
import 'features/widgets/appdrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.kBackgroundColor,
        colorScheme: ColorScheme.light(
          primary: GlobalVariables.kSecondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 3,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoutes(settings),
      home: const Scaffold(
        body: ResponsiveLayout(
          webScreenLayout: MainPage(),
          mobileScreenLayout: MobileScreenLayout(),
        ),
      ),
    );
  }
}
