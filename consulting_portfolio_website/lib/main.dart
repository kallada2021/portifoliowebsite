import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/responsive/mobile_screen_layout.dart';
import 'package:consulting_portfolio_website/features/responsive/responsive_layout.dart';
import 'package:consulting_portfolio_website/routes.dart';
import 'package:flutter/material.dart';

import 'features/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        cardColor: Colors.purple[400]!.withOpacity(0.2),
        appBarTheme: const AppBarTheme(
          elevation: 3,
          iconTheme: IconThemeData(
            color: Colors.white70,
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
