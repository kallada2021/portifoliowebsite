import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import '../widgets/services_card.dart';
import '../widgets/textdelegateheader.dart';

class ServicesScreen extends StatelessWidget {
  static const String routeName = "/servicespage";
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: TextDelegateHeaderWidget(title: "Our Services"),
          ),
          SliverToBoxAdapter(
            child: Column(
              children:[
                Text("Our Services"),
                Text("AWS"),
                Row(
                  children: [
                    ServicesCard(
                      title:"EC2",
                      description: "Deploy an application to EC2",
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
