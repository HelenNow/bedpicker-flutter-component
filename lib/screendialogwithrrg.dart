import 'package:bedcomponent/app_constants.dart';
import 'package:bedcomponent/color_constants.dart';
import 'package:flutter/material.dart';

/// A dialog containing a title and description or a custom content widget.
///
/// Includes a cancel/back button (X).
class ScreenDialogWithRRg extends StatelessWidget {
  final String? title;

  final String? description;

  final double fontSize;
  final TextAlign? textAlign;

  final double? textHeight;

  final double? borderRadius;

  final FontWeight fontWeight;

  final EdgeInsets contentPadding;

  final EdgeInsets? titleTextMargin;

  /// The background color of the cancel (X) button.
  final Color cancelButtonColor;

  final AlignmentGeometry titleAlignment;

  /// The content to be displayed.
  ///
  /// Takes priority over the description (i.e. if both content and description are provided, the content is shown).
  final Widget? content;

  final Widget? titleIcon;
  final Color? color;

  const ScreenDialogWithRRg({
    required this.title,
    required this.cancelButtonColor,
    required this.titleAlignment,
    this.fontSize = AppConstants.fontLargeX,
    this.fontWeight = FontWeight.bold,
    this.contentPadding = const EdgeInsets.fromLTRB(24, 15, 24, 24),
    this.description,
    this.borderRadius,
    this.titleTextMargin,
    this.textHeight,
    this.textAlign,
    this.content,
    this.color,
    this.titleIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: color ?? Colors.white,
      backgroundColor: color ?? Colors.white,
      title: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          if (titleIcon != null)
            Container(
              alignment: titleAlignment,
              margin: titleTextMargin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (title != null)
                    Text(
                      title!,
                      textAlign: textAlign ?? TextAlign.center,
                      style: TextStyle(
                        color: ColorConstants.black,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        height: textHeight,
                      ),
                    ),
                  titleIcon!,
                ],
              ),
            ),
          if (titleIcon == null)
            Container(
              alignment: titleAlignment,
              margin: titleTextMargin,
              child: title == null
                  ? const SizedBox.shrink()
                  : Text(
                      title ?? '',
                      textAlign: textAlign ?? TextAlign.center,
                      style: TextStyle(
                        color: ColorConstants.black,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        height: textHeight,
                      ),
                    ),
            ),
          Positioned(
            top: 0,
            right: 2,
            child: IconButton(
              iconSize: 32,
              onPressed: () {
                Navigator.pop(context);
              },
              color: cancelButtonColor,
              icon: const Icon(
                Icons.cancel,
                color: ColorConstants.mainPurple,
              ),
            ),
          ),
        ],
      ),
      content: content != null
          ? SingleChildScrollView(child: content)
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 6,
                ),
                if (description?.isNotEmpty ?? false)
                  Text(
                    description!,
                    textAlign: textAlign ?? TextAlign.center,
                    style: const TextStyle(
                      color: ColorConstants.black,
                      fontWeight: FontWeight.normal,
                      fontSize: AppConstants.fontDialogDescription,
                      height: 1.4,
                    ),
                  ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            borderRadius ?? 20,
          ),
        ),
      ),
      contentPadding: contentPadding,
    );
  }
}
