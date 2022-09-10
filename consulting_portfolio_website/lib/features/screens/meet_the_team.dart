import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:consulting_portfolio_website/constants/utils.dart';
import 'package:consulting_portfolio_website/features/models/meet_the_team_model.dart';
import 'package:consulting_portfolio_website/features/services/meet_the_team_service.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:consulting_portfolio_website/features/widgets/footer.dart';
import 'package:consulting_portfolio_website/features/widgets/meet_the_team_widget.dart';
import 'package:flutter/material.dart';

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
      "Services from widget $teamMembers".log();
      setState(() {});
      isLoading = false;
    } catch (error) {
      "An error occurred $error".log();
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
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Our Team",
                        style: GlobalVariables.kTechPageTitleStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        // height: size.height,
                        height: teamMembers.length * 150,
                        child: ListView.builder(
                          itemCount: teamMembers.length,
                          itemBuilder: (ctx, index) {
                            return MeetTheTeamWidget(
                              nameText: teamMembers[index].name,
                              descriptionText: teamMembers[index].description,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        "Team Achievements",
                        style: GlobalVariables.kTechPageTitleStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Certified AWS Solutions Architect\nCertified Azure Solutions Architect",
                          style: TextStyle(
                            color: Colors.deepPurple[900],
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                    ],
                  ),
                ),
    );
  }
}
