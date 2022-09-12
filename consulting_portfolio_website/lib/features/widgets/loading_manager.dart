import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/global_variables.dart';
import '../providers/appstate.dart';

class LoadingManager extends StatelessWidget {
  final AppState isLoading;
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
        isLoading == AppState.loading
            ? Container(
                color: Colors.purple.withOpacity(0.5),
              )
            : Container(),
        isLoading == AppState.loading
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
