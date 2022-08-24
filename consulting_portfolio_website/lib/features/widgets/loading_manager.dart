import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/global_variables.dart';

class LoadingManager extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoadingManager({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isLoading
            ? Container(
                color: Colors.purple.withOpacity(0.5),
              )
            : Container(),
        isLoading
            ? Center(
                child: SpinKitFadingFour(
                  color: Colors.deepPurple,
                ),
              )
            : Container(),
      ],
    );
  }
}
