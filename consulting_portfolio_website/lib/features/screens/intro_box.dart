import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class IntroBox extends StatelessWidget {
  const IntroBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 200,
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
                  width: size.width > 800 ? 500 : 350,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Magnolia IT Solutions (MITS) was founded just over a year ago by a husband and wife dynamic duo.\n Their career paths couldn’t be more different.  "
                      "Send us a message, let’s chat now!",
                      style: TextStyle(
                        fontSize: 16,
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
