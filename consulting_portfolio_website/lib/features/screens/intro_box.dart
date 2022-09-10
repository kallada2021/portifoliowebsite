import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class IntroBox extends StatelessWidget {
  const IntroBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width >= 1000? 200 : 900,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 162, 236, 233),
          ],
          stops: [0.5, 0.8],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: const [
                  Icon(
                    IconlyLight.user3,
                    size: 20,
                    color: Colors.white70,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "ABOUT US",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: SizedBox(
                  width: size.width > 800 ? 1050: 350,
                  // height: 900,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Magnolia IT Solutions (MITS) was founded just over a year ago by a husband and wife dynamic duo. Their career paths couldn’t be more different.  A Social Worker and a Software Engineer each with over two decades of service. On a normal work day, our professional worlds would never meet.  At Magnolia IT Solutions, it is a perfect combination of social work skills and technology  to create an impressionable upgrade to your business. Magnolia IT Solutions prides itself on assisting large and small organizations advance their business. This will be achieved by creating websites, mobile applications, automation for business processes and infrastructure provisioning on a cloud platform. Our customers have the unique opportunity to leverage the expertise and profound technical background of the best minds in the industry to create stellar IT strategy and products that align with your business goals. We will analyze, develop and implement all of your IT needs using the latest technology stack (Azure, AWS, Terraform, etc.)  To put it simple, MITS wants to help anyone who wants to optimize the software/hardware of their business and take it to the next level. Send us a message, let’s chat now!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
