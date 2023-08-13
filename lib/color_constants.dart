import 'package:flutter/painting.dart';

/// A collection of the primary colors used throughout the app.
class ColorConstants {
  /// A: 255, R: 41, G: 41, B: 41.
  static const Color black = Color.fromARGB(255, 41, 41, 41);

  /// A: 255, R: 106, G: 106, B: 106.
  static const Color greyDarkest = Color.fromARGB(255, 106, 106, 106);

  /// A: 255, R: 144, G: 144, B: 144.
  static const Color greyDark = Color.fromARGB(255, 144, 144, 144);

  /// A: 255, R: 175, G: 175, B: 175.
  static const Color greyLight = Color.fromARGB(255, 175, 175, 175);

  /// A: 255, R: 225, G: 225, B: 225.
  static const Color greyLightest = Color.fromARGB(255, 225, 225, 225);

  /// A: 255, R: 255, G: 255, B: 255.
  static const Color white = Color.fromARGB(255, 255, 255, 255);

  /// A: 255, R: 237, G: 237, B: 237,
  static const Color offWhite = Color.fromARGB(255, 237, 237, 237);

  /// A: 255, R: 250, G: 211, B: 219.
  static const Color pink = Color.fromARGB(255, 250, 211, 219);

  /// A: 255, R: 251, G: 218, B: 213.
  static const Color salmon = Color.fromARGB(255, 251, 218, 213);

  /// A: 255, R: 217, G: 209, B: 227.
  static const Color purpleLight = Color.fromARGB(255, 217, 209, 227);

  /// A: 255, R: 103, G: 44, B: 140.
  static const Color purpleDark = Color.fromARGB(255, 103, 44, 140);

  /// A: 255, R: 255, G: 98, B: 61.
  static const Color orange = Color.fromARGB(255, 255, 98, 61);

  /// A: 255, R: 244, G: 54, B: 93.
  static const Color red = Color.fromARGB(255, 244, 54, 93);

  /// A: 255, R: 79, G: 180, B: 6.
  static const Color green = Color.fromARGB(255, 79, 180, 6);

  //

  /// A: 255, R: 234, G: 31, B: 118.
  static const Color gradient1 = Color.fromARGB(255, 234, 31, 118);

  /// A: 255, R: 246, G: 74, B: 84.
  static const Color gradient2 = Color.fromARGB(255, 246, 74, 84);

  ///A: 255, R: 249, G: 98, B: 68.
  static const Color gradient3 = Color.fromARGB(255, 249, 98, 68);

  //

  /// A: 255, R: 250, G: 211, B: 219.
  static const Color backgroundRed = Color.fromARGB(255, 250, 211, 219);

  /// A: 255, R: 251, G: 218, B: 213.
  static const Color backgroundOrange = Color.fromARGB(255, 251, 218, 213);

  /// A: 255, R: 217, G: 209, B: 227.
  static const Color backgroundBlue = Color.fromARGB(255, 217, 209, 227);

  //

  /// HEX: 0x00FBDAD5, opacity: 0.9.
  static final Color dialogColor = const Color(0x00FBDAD5).withOpacity(0.9);

  //

  /// The decoration given to a container to display the gradient background of the app.
  static final BoxDecoration loginBackgroundDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const <double>[
        0,
        0.4,
        0.55,
      ],
      colors: <Color>[
        ColorConstants.gradient1.withOpacity(0.95),
        ColorConstants.gradient2.withOpacity(0.95),
        ColorConstants.gradient3.withOpacity(0.95),
      ],
    ),
  );
}
