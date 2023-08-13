import 'package:bedcomponent/color_constants.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? loadingIndicatorColor;

  /// Returns a ```CircularProgressIndicator``` centered inside its parent widget.
  const LoadingIndicator({
    Key? key,
    this.loadingIndicatorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: loadingIndicatorColor ?? ColorConstants.purpleDark,
        strokeWidth: 2.0,
      ),
    );
  }
}
