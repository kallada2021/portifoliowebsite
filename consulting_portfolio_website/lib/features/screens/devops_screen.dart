import 'package:consulting_portfolio_website/constants/constants.dart';
import 'package:consulting_portfolio_website/features/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class DevopsScreen extends StatelessWidget {
  static const String routeName = "/devopstechnologies";

  const DevopsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                "Devops TechStack",
                style: TextStyle(
                  fontSize: 100,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Terraform",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.deepPurple[900]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red[300],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.blue[100],
                  elevation: 15,
                  shadowColor: Colors.blue[900],
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        terraformIntro,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
