import 'package:flutter/material.dart';

class DesignSystemTypography {
  const DesignSystemTypography._();

  //fonts
  static const String familyOpenSans = 'OpenSans';
  static const String familyRoboto = 'Roboto';

  //sizes
  static const double sizeXXS = 9; // 10, 11,
  static const double sizeXS = 13; // 12, 14,
  static const double sizeS = 16; // 15, 16, 17
  static const double sizeSM = 21; // 20, 21
  static const double sizeSL = 28; // 24
  static const double sizeMD = 34; // 34
  static const double sizeML = 40; // 40
  static const double sizeLG = 45; // 45
  static const double sizeXL = 48; // 48
  static const double sizeXXL = 55; // 60, 56
  static const double sizeXXXL = 104; // 96, 112

  static const TextTheme appMaterialTextLightTheme = TextTheme(
    displayLarge: TextStyle(
      debugLabel: 'Black OpenSans displayLarge',
      fontFamily: 'OpenSans',
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    displayMedium: TextStyle(
      debugLabel: 'Black OpenSans displayMedium',
      fontFamily: 'OpenSans',
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    displaySmall: TextStyle(
      debugLabel: 'Black OpenSans displaySmall',
      fontFamily: 'OpenSans',
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    headlineLarge: TextStyle(
      debugLabel: 'Black OpenSans headlineLarge',
      fontFamily: 'OpenSans',
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    headlineMedium: TextStyle(
      debugLabel: 'Black OpenSans headlineMedium',
      fontFamily: 'OpenSans',
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    headlineSmall: TextStyle(
      debugLabel: 'Black OpenSans headlineSmall',
      fontFamily: 'OpenSans',
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    titleLarge: TextStyle(
      debugLabel: 'Black OpenSans titleLarge',
      fontFamily: 'OpenSans',
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    titleMedium: TextStyle(
      debugLabel: 'Black OpenSans titleMedium',
      fontFamily: 'OpenSans',
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    titleSmall: TextStyle(
      debugLabel: 'Black OpenSans titleSmall',
      fontFamily: 'OpenSans',
      color: Colors.black,
      decoration: TextDecoration.none,
    ),
    bodyLarge: TextStyle(
      debugLabel: 'Black Roboto bodyLarge',
      fontFamily: 'Roboto',
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    bodyMedium: TextStyle(
      debugLabel: 'Black Roboto bodyMedium',
      fontFamily: 'Roboto',
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    bodySmall: TextStyle(
      debugLabel: 'Black Roboto bodySmall',
      fontFamily: 'Roboto',
      color: Colors.black54,
      decoration: TextDecoration.none,
    ),
    labelLarge: TextStyle(
      debugLabel: 'Black Roboto labelLarge',
      fontFamily: 'Roboto',
      color: Colors.black87,
      decoration: TextDecoration.none,
    ),
    labelMedium: TextStyle(
      debugLabel: 'Black Roboto labelMedium',
      fontFamily: 'Roboto',
      color: Colors.black,
      decoration: TextDecoration.none,
    ),
    labelSmall: TextStyle(
      debugLabel: 'Black Roboto labelSmall',
      fontFamily: 'Roboto',
      color: Colors.black,
      decoration: TextDecoration.none,
    ),
  );

  static const TextTheme appMaterialTextDarkTheme = TextTheme(
    displayLarge: TextStyle(
      debugLabel: 'Black OpenSans displayLarge',
      fontFamily: 'OpenSans',
      color: Colors.white70,
      decoration: TextDecoration.none,
    ),
    displayMedium: TextStyle(
      debugLabel: 'Black OpenSans displayMedium',
      fontFamily: 'OpenSans',
      color: Colors.white70,
      decoration: TextDecoration.none,
    ),
    displaySmall: TextStyle(
      debugLabel: 'Black OpenSans displaySmall',
      fontFamily: 'OpenSans',
      color: Colors.white70,
      decoration: TextDecoration.none,
    ),
    headlineLarge: TextStyle(
      debugLabel: 'Black OpenSans headlineLarge',
      fontFamily: 'OpenSans',
      color: Colors.white70,
      decoration: TextDecoration.none,
    ),
    headlineMedium: TextStyle(
      debugLabel: 'Black OpenSans headlineMedium',
      fontFamily: 'OpenSans',
      color: Colors.white70,
      decoration: TextDecoration.none,
    ),
    headlineSmall: TextStyle(
      debugLabel: 'Black OpenSans headlineSmall',
      fontFamily: 'OpenSans',
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
    titleLarge: TextStyle(
      debugLabel: 'Black OpenSans titleLarge',
      fontFamily: 'OpenSans',
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
    titleMedium: TextStyle(
      debugLabel: 'Black OpenSans titleMedium',
      fontFamily: 'OpenSans',
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
    titleSmall: TextStyle(
      debugLabel: 'Black OpenSans titleSmall',
      fontFamily: 'OpenSans',
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
    bodyLarge: TextStyle(
      debugLabel: 'Black Roboto bodyLarge',
      fontFamily: 'Roboto',
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
    bodyMedium: TextStyle(
      debugLabel: 'Black Roboto bodyMedium',
      fontFamily: 'Roboto',
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
    bodySmall: TextStyle(
      debugLabel: 'Black Roboto bodySmall',
      fontFamily: 'Roboto',
      color: Colors.white70,
      decoration: TextDecoration.none,
    ),
    labelLarge: TextStyle(
      debugLabel: 'Black Roboto labelLarge',
      fontFamily: 'Roboto',
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
    labelMedium: TextStyle(
      debugLabel: 'Black Roboto labelMedium',
      fontFamily: 'Roboto',
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
    labelSmall: TextStyle(
      debugLabel: 'Black Roboto labelSmall',
      fontFamily: 'Roboto',
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
  );

  static const TextTheme appMaterialEnglishLikeTextTheme = TextTheme(
    displayLarge: TextStyle(
      debugLabel: 'englishLike displayLarge ',
      fontSize: sizeXL,
      fontWeight: FontWeight.w300,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: -1.5,
    ),
    displayMedium: TextStyle(
      debugLabel: 'englishLike displayMedium',
      fontSize: sizeXL,
      fontWeight: FontWeight.w300,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: -0.5,
    ),
    displaySmall: TextStyle(
      debugLabel: 'englishLike displaySmall',
      fontSize: sizeXL,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.0,
    ),
    headlineLarge: TextStyle(
      debugLabel: 'englishLike headlineLarge',
      fontSize: sizeML,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.25,
    ),
    headlineMedium: TextStyle(
      debugLabel: 'englishLike headlineMedium',
      fontSize: sizeMD,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.25,
    ),
    headlineSmall: TextStyle(
      debugLabel: 'englishLike headlineSmall',
      fontSize: sizeSL,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.0,
    ),
    titleLarge: TextStyle(
      debugLabel: 'englishLike titleLarge',
      fontSize: sizeSM,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.15,
    ),
    titleMedium: TextStyle(
      debugLabel: 'englishLike titleMedium',
      fontSize: sizeS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      debugLabel: 'englishLike titleSmall',
      fontSize: sizeXS,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.1,
    ),
    bodyLarge: TextStyle(
      debugLabel: 'englishLike bodyLarge',
      fontSize: sizeS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      debugLabel: 'englishLike bodyMedium',
      fontSize: sizeXS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      debugLabel: 'englishLike bodySmall',
      fontSize: sizeXS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.4,
    ),
    labelLarge: TextStyle(
      debugLabel: 'englishLike labelLarge',
      fontSize: sizeXS,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 1.25,
    ),
    labelMedium: TextStyle(
      debugLabel: 'englishLike labelMedium',
      fontSize: sizeXXS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 1.5,
    ),
    labelSmall: TextStyle(
      debugLabel: 'englishLike labelSmall',
      fontSize: sizeXXS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 1.5,
    ),
  );

  static const TextTheme appMaterialDensetextTheme = TextTheme(
    displayLarge: TextStyle(
      debugLabel: 'dense displayLarge',
      inherit: false,
      fontSize: sizeXL,
      fontWeight: FontWeight.w100,
      textBaseline: TextBaseline.ideographic,
    ),
    displayMedium: TextStyle(
      debugLabel: 'dense displayMedium',
      inherit: false,
      fontSize: sizeXXL,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    displaySmall: TextStyle(
      debugLabel: 'dense displaySmall',
      inherit: false,
      fontSize: sizeLG,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    headlineLarge: TextStyle(
      debugLabel: 'dense headlineLarge',
      inherit: false,
      fontSize: sizeML,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    headlineMedium: TextStyle(
      debugLabel: 'dense headlineMedium',
      inherit: false,
      fontSize: sizeMD,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    headlineSmall: TextStyle(
      debugLabel: 'dense headlineSmall',
      inherit: false,
      fontSize: sizeSL,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    titleLarge: TextStyle(
      debugLabel: 'dense titleLarge',
      inherit: false,
      fontSize: 21,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic,
    ),
    titleMedium: TextStyle(
      debugLabel: 'dense titleMedium',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    titleSmall: TextStyle(
      debugLabel: 'dense titleSmall',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic,
    ),
    bodyLarge: TextStyle(
      debugLabel: 'dense bodyLarge',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic,
    ),
    bodyMedium: TextStyle(
      debugLabel: 'dense bodyMedium',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    bodySmall: TextStyle(
      debugLabel: 'dense bodySmall',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    labelLarge: TextStyle(
      debugLabel: 'dense labelLarge',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic,
    ),
    labelMedium: TextStyle(
      debugLabel: 'dense labelMedium',
      inherit: false,
      fontSize: sizeXS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    labelSmall: TextStyle(
      debugLabel: 'dense labelSmall',
      inherit: false,
      fontSize: sizeXXS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
  );

  static const TextTheme appMaterialTallTextTheme = TextTheme(
    displayLarge: TextStyle(
      debugLabel: 'tall displayLarge',
      inherit: false,
      fontSize: sizeXL,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
    ),
    displayMedium: TextStyle(
      debugLabel: 'tall displayMedium',
      inherit: false,
      fontSize: sizeXXL,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    displaySmall: TextStyle(
      debugLabel: 'tall displaySmall',
      inherit: false,
      fontSize: sizeLG,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    headlineLarge: TextStyle(
      debugLabel: 'tall headlineLarge',
      inherit: false,
      fontSize: sizeML,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    headlineMedium: TextStyle(
      debugLabel: 'tall headlineMedium',
      inherit: false,
      fontSize: sizeMD,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    headlineSmall: TextStyle(
      debugLabel: 'tall headlineSmall',
      inherit: false,
      fontSize: sizeSL,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    titleLarge: TextStyle(
      debugLabel: 'tall titleLarge',
      inherit: false,
      fontSize: sizeSL,
      fontWeight: FontWeight.w700,
      textBaseline: TextBaseline.ideographic,
    ),
    titleMedium: TextStyle(
      debugLabel: 'tall titleMedium',
      inherit: false,
      fontSize: sizeSM,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    titleSmall: TextStyle(
      debugLabel: 'tall titleSmall',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic,
    ),
    bodyLarge: TextStyle(
      debugLabel: 'tall bodyLarge',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w700,
      textBaseline: TextBaseline.ideographic,
    ),
    bodyMedium: TextStyle(
      debugLabel: 'tall bodyMedium',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    bodySmall: TextStyle(
      debugLabel: 'tall bodySmall',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    labelLarge: TextStyle(
      debugLabel: 'tall labelLarge',
      inherit: false,
      fontSize: sizeS,
      fontWeight: FontWeight.w700,
      textBaseline: TextBaseline.ideographic,
    ),
    labelMedium: TextStyle(
      debugLabel: 'tall labelMedium',
      inherit: false,
      fontSize: sizeXS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
    labelSmall: TextStyle(
      debugLabel: 'tall labelSmall',
      inherit: false,
      fontSize: sizeXXS,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,
    ),
  );
}
