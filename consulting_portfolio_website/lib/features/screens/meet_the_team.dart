import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/constants/utils.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/footer.dart';
import 'package:flutter/material.dart';

import '../widgets/appdrawer.dart';

class MeetTheTeamScreen extends StatelessWidget {
  static const routeName = "/meet-the-team";
  const MeetTheTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Scaffold(
      appBar: customAppBar(context),
      drawer: size.width > 1000.0 ? null : const AppDrawer(),
      bottomSheet: const Footer(),
      body: Column(
        children: const [
          Text(
            "Meet the team",
            style: GlobalVariables.kTechPageTitleStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text("This is where the info about team members go!!"),
        ],
      ),
    );
  }
}
