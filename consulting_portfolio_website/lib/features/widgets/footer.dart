import 'package:consulting_portfolio_website/constants/global_variables.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      color: GlobalVariables.secondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("About",style: GlobalVariables.kFooterTextStyle,),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Contacts",style: GlobalVariables.kFooterTextStyle,),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Services",style: GlobalVariables.kFooterTextStyle,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
