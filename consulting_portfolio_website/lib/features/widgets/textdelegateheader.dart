import 'package:flutter/material.dart';

class TextDelegateHeaderWidget extends SliverPersistentHeaderDelegate {
  String? title;
  TextDelegateHeaderWidget({this.title});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal[200]!,
              Colors.redAccent[100]!,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [
              0.0,
              1.0,
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        height: 100,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: InkWell(
          child: Text(
            title.toString(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 50,
              letterSpacing: 3,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100; // height

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
