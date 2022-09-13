import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import '../../constants/utils.dart';

class Project extends StatefulWidget {
  final String title;
  final String description;
  String? imageURL;

  Project({
    Key? key,
    required this.title,
    required this.description,
    this.imageURL,
  }) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;

    return Column(
      children: [
        size.width > 900.0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: InkWell(
                      hoverColor: Colors.purple[100],
                      onTap: () {
                        Utils.showPictureBox(
                          context,
                          widget.title,
                          widget.imageURL!,
                        );
                      },
                      onHover: (bool isPictureHovered) {
                        isHovered = !isHovered;
                        setState(() {});
                      },
                      child: isHovered
                          ? SizedBox(
                              height: 550,
                              width: 550,
                              child: widget.imageURL != null
                                  ? Image.network(widget.imageURL!)
                                  : Container(),
                            )
                          : SizedBox(
                              height: 500,
                              width: 500,
                              child: widget.imageURL != null
                                  ? Image.network(widget.imageURL!)
                                  : Container(),
                            ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                color: GlobalVariables.kSecondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                  color: GlobalVariables.kSecondaryColor),
                            ),
                          ),
                          const Divider(
                            color: Colors.pinkAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: InkWell(
                      hoverColor: Colors.purple[100],
                      onTap: () {
                        Utils.showPictureBox(
                          context,
                          widget.title,
                          widget.imageURL!,
                        );
                      },
                      onHover: (bool isPictureHovered) {
                        isHovered = !isHovered;
                        setState(() {});
                      },
                      child: isHovered
                          ? SizedBox(
                              height: 300,
                              width: size.width * 0.9,
                              child: widget.imageURL != null
                                  ? Image.network(widget.imageURL!)
                                  : Container(),
                            )
                          : SizedBox(
                              width: size.width * 0.85,
                              height: 280,
                              child: widget.imageURL != null
                                  ? Image.network(widget.imageURL!)
                                  : Container(),
                            ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                color: GlobalVariables.kSecondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                color: GlobalVariables.kSecondaryColor,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const SizedBox(
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
