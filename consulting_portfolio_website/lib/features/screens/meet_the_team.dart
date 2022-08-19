import 'dart:developer';

import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/constants/utils.dart';
import 'package:consulting_portfolio_website/features/models/meet_the_team_model.dart';
import 'package:consulting_portfolio_website/features/services/meet_the_team_service.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/footer.dart';
import 'package:consulting_portfolio_website/features/widgets/meet_the_team_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/appdrawer.dart';

class MeetTheTeamScreen extends StatefulWidget {
  static const routeName = "/meet-the-team";
  const MeetTheTeamScreen({Key? key}) : super(key: key);

  @override
  State<MeetTheTeamScreen> createState() => _MeetTheTeamScreenState();
}

class _MeetTheTeamScreenState extends State<MeetTheTeamScreen> {
  List<MeetTheTeam> teamMembers = [];
  bool isError = false;
  String errorMsg = "";
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    getTeamMembers();
    super.didChangeDependencies();
  }

  getTeamMembers() async {
    try {
      isLoading = true;
      teamMembers = await MeetTheTeamService.getTeamMembers(context: context);
      print("Services from widget $teamMembers");
      setState(() {});
      isLoading = false;
    } catch (error) {
      log("An error occurred $error");
      isError = true;
      errorMsg = "Sorry, an unexpected error occurred";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Scaffold(
      appBar: customAppBar(context),
      // drawer: size.width > 1000.0 ? null : const AppDrawer(),
      bottomSheet: const Footer(),
      body: isError
          ? Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Text(
                  errorMsg,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          : isLoading
              ? Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: GlobalVariables.kSecondaryColor,
                    ),
                  ),
                )
              : Column(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    MeetTheTeamWidget(
                      descriptionText: "Description of a team member",
                      nameText: "Director",
                    ),
                    MeetTheTeamWidget(
                      nameText: "Lead Architect",
                      descriptionText:
                          "Lead designer and developer of software.  He enjoys working with different "
                          "technologies and developing different types of products and solutions.",
                    ),
                    MeetTheTeamWidget(
                      nameText: "Project Manager",
                      descriptionText: "Description of a team member",
                    ),
                    MeetTheTeamWidget(
                      nameText: "Development Team",
                      descriptionText: "Description of a team member",
                    ),
                  ],
                ),
    );
  }
}
