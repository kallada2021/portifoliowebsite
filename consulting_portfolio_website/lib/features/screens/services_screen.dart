import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/features/screens/aws_services.dart';
import 'package:consulting_portfolio_website/features/screens/mobiledev_services.dart';
import 'package:consulting_portfolio_website/features/screens/service_home.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../widgets/services_card.dart';
import '../widgets/textdelegateheader.dart';
import 'azure_services.dart';

class ServicesScreen extends StatefulWidget {
  static const String routeName = "/servicespage";
  ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {"page": const ServicesHomeScreen(), "Title": "Services"},
    {"page": AWSServicesScreen(), "Title": "AWS Services"},
    {"page": AzureServicesScreen(), "Title": "Azure Services"},
    {"page": MobileServicesScreen(), "Title": "Mobile Development"}
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: _pages[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: GlobalVariables.kSecondaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor:
                _selectedIndex == 0 ? Colors.white60 : Colors.black,
            icon: Icon(
              IconlyBold.chart,
            ),
            label: "All Services",
          ),
          BottomNavigationBarItem(
            backgroundColor:
                _selectedIndex == 1 ? Colors.white60 : Colors.black,
            icon: Icon(Icons.computer),
            label: "AWS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: "AZURE",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_friendly),
            label: "MOBILE DEVELOPMENT",
          ),
        ],
      ),
    );
  }
}
