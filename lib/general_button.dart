import 'package:bedcomponent/app_constants.dart';
import 'package:bedcomponent/color_constants.dart';
import 'package:bedcomponent/loading_indicator.dart';
import 'package:flutter/material.dart';

/// A general-purpose button to be used throughout the app.
///
/// Customizable but keeps the feel of most buttons (i.e. no elevation, bold font, etc.)
class GeneralButton extends StatelessWidget {
  /// Represents the text inside the button (i.e. the label).
  final String buttonText;

  final double fontSize;

  final double height;

  final double width;

  final double borderRadius;

  final Color buttonColor;

  final Color textColor;

  final EdgeInsets margin;
  final bool isloading;
  final bool customRadius;
  final Widget? icon;

  /// A callback to be invoked if the button is clicked.
  ///
  /// If null, the button will be disabled (i.e. no callback on click and a grey background).
  final Function? handleTap;

  const GeneralButton({
    required this.buttonText,
    required this.buttonColor,
    required this.handleTap,
    this.customRadius = false,
    this.fontSize = AppConstants.fontMediumX,
    this.height = 60,
    this.width = 120,
    this.icon,
    this.isloading = false,
    this.borderRadius = 20,
    this.textColor = ColorConstants.white,
    this.margin = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: customRadius
                  ? BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                      bottomLeft: Radius.circular(borderRadius))
                  : BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        // disabled if handleTap == null
        onPressed: handleTap == null ? null : () => handleTap!(),
        child: isloading
            ? const LoadingIndicator()
            : icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        buttonText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                        ),
                      ),
                      icon!
                    ],
                  )
                : Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                    ),
                  ),
      ),
    );
  }
}
