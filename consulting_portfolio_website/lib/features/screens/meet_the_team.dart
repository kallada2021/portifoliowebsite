import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class MeetTheTeamScreen extends StatelessWidget {
  static const routeName = "/meet-the-team";
  const MeetTheTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Column(
        children: const [
          Text("Meet the team"),
        ],
      ),
    );
  }
}
