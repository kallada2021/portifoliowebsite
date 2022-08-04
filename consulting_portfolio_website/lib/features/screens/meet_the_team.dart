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
      body: Center(
        child: Column(
          children: const [
            Text(
              "Meet the team",
              style: GlobalVariables.kTechPageTitleStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Team Member One",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "This is where the info about team members go!!",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              height: 3,
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}
