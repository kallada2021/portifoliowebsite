import 'package:flutter/material.dart';

class IntroBox extends StatelessWidget {
  const IntroBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.people_alt_outlined,
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
              SizedBox(
                height: 10.0,
              ),
              //TODO: Write introduction of our company
              Text("This is the about us text. This is what we provide"),
            ],
          )
        ],
      ),
    );
  }
}
