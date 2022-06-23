import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/responsive/mobile_screen_layout.dart';
import 'package:consulting_portfolio_website/features/responsive/responsive_layout.dart';
import 'package:consulting_portfolio_website/features/screens/contactus.dart';
import 'package:consulting_portfolio_website/features/widgets/custombutton.dart';
import 'package:consulting_portfolio_website/routes.dart';
import 'package:flutter/material.dart';

import 'features/screens/main_page.dart';

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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 3,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoutes(settings),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              children: [
                const SizedBox(
                  width: GlobalVariables.lineWidth,
                ),
                const Text(
                  "MAGNOLIA IT SOLUTIONS",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 200,
                ),
                const SizedBox(
                  width: GlobalVariables.lineWidth,
                ),
                Text("Services"),
                const SizedBox(
                  width: GlobalVariables.lineWidth,
                ),
                Text("Technologies"),
                const SizedBox(
                  width: GlobalVariables.lineWidth,
                ),
                Text("Clients"),
                const SizedBox(
                  width: GlobalVariables.lineWidth,
                ),
                CustomButton(
                    text: "CONTACT US",
                    onPressed: () {
                      print("Contact us BTN");
                      Navigator.pushNamed(context, ContactUsScreen.routeName);
                    })
              ],
            ),
          ),
        ),
        body: const ResponsiveLayout(
          webScreenLayout: MainPage(),
          mobileScreenLayout: MobileScreenLayout(),
        ),
      ),
    );
  }
}
