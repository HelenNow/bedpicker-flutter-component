import 'package:bedcomponent/app_constants.dart';
import 'package:bedcomponent/color_constants.dart';
import 'package:flutter/material.dart';

/// A dialog containing a title and description or a custom content widget.
///
/// Includes a cancel/back button (X).
class ScreenDialog extends StatelessWidget {
  final String title;

  final String? description;

  final double fontSize;

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

  const ScreenDialog({
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
    this.content,
    this.titleIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          if (titleIcon != null)
            Container(
              alignment: titleAlignment,
              margin: titleTextMargin,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstants.black,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    height: textHeight,
                  ),
                ),
                titleIcon!,
              ]),
            ),
          if (titleIcon == null)
            Container(
              alignment: titleAlignment,
              margin: titleTextMargin,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConstants.black,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  height: textHeight,
                ),
              ),
            ),
          Positioned(
            top: -33.5,
            right: -33.5,
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.purpleDark,
              ),
            ),
          ),
          Positioned(
            top: -30,
            right: -28,
            width: 15,
            height: 15,
            child: Container(
              color: ColorConstants.white,
            ),
          ),
          Positioned(
            top: -45,
            right: -45,
            child: IconButton(
              iconSize: 32,
              onPressed: () {
                //  final NavigatorState navigator = Navigator.of(context);

                // NavigationUtils.safePop(navigator);
              },
              color: cancelButtonColor,
              icon: const Icon(
                Icons.cancel,
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
                    textAlign: TextAlign.center,
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
      backgroundColor: ColorConstants.white,
      contentPadding: contentPadding,
    );
  }
}
