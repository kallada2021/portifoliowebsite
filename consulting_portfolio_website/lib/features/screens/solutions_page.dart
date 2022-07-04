import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class SolutionsPage extends StatefulWidget {
  const SolutionsPage({Key? key}) : super(key: key);

  @override
  State<SolutionsPage> createState() => _SolutionsPageState();
}

class _SolutionsPageState extends State<SolutionsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: customAppBar(context),
        body: Column(
          children: [
            Container(
              color: Colors.green[200],
              child: const TabBar(
                indicatorColor: Colors.white54,
                indicatorWeight: 6,
                tabs: [
                  Tab(
                    text: "AWS",
                  ),
                  Tab(
                    text: "AZURE",
                  ),
                  Tab(
                    text: "MOBILE DEVELOPMENT",
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green[100],
              child: const TabBarView(
                children: [
                  Text("AWS"),
                  Text("AZURE"),
                  Text("MOBILE DEVELOPMENT")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
