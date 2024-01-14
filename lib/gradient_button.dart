import 'package:bedcomponent/app_constants.dart';
import 'package:bedcomponent/color_constants.dart';
import 'package:bedcomponent/loading_indicator.dart';
import 'package:flutter/material.dart';

/// A general-purpose button to be used throughout the app.
///
/// Customizable but keeps the feel of most buttons (i.e. no elevation, bold font, etc.)
class GradientButton extends StatelessWidget {
  /// Represents the text inside the button (i.e. the label).
  final String buttonText;

  final double fontSize;

  final double height;

  final double width;
  final TextStyle? customStyle;

  final double borderRadius;
  final Color textColor;

  final EdgeInsets margin;
  final bool isloading;
  final bool customRadius;
  final Widget? icon;
  final FontWeight? fontWeight;
  final bool isDisabled;

  /// A callback to be invoked if the button is clicked.
  ///
  /// If null, the button will be disabled (i.e. no callback on click and a grey background).
  final Function? handleTap;

  const GradientButton({
    required this.buttonText,
    required this.handleTap,
    this.customRadius = false,
    this.fontSize = AppConstants.fontMediumX,
    this.height = 40,
    this.width = 120,
    this.icon,
    this.fontWeight,
    this.isloading = false,
    this.customStyle,
    this.borderRadius = 20,
    this.textColor = ColorConstants.white,
    this.margin = EdgeInsets.zero,
    this.isDisabled = false,
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: isDisabled ? ColorConstants.greyLight : null,
        gradient: isDisabled
            ? null
            : const LinearGradient(
                colors: [
                  ColorConstants.buttonpink,
                  ColorConstants.buttonpurple,
                ], // Adjust gradient colors as needed
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
        borderRadius: BorderRadius.circular(customRadius ? borderRadius : 55),
      ),
      child: isloading
          ? const LoadingIndicator()
          : InkWell(
              onTap:
                  handleTap == null || isDisabled ? null : () => handleTap!(),
              child: Center(
                child: icon != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          icon!,
                          Text(
                            buttonText,
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: fontWeight ?? FontWeight.bold,
                                color: textColor),
                          ),
                          const Icon(Icons.arrow_right)
                        ],
                      )
                    : Text(
                        buttonText,
                        textAlign: TextAlign.center,
                        style: customStyle ??
                            TextStyle(
                                fontSize: fontSize,
                                fontWeight: fontWeight ?? FontWeight.bold,
                                color: textColor),
                      ),
              ),
            ),
    );
  }
}
