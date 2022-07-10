import 'package:flutter/material.dart';

class ProjectPicture extends StatelessWidget {
  late String? imageUrl;
  static const String routeName = "/projectpicture";
  ProjectPicture({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1000,
        height: 1000,
        color: Colors.amber,
        child: imageUrl != null ? Image.network(imageUrl!) : Container(),

      ),
    );
  }
}
