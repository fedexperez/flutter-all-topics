import 'package:flutter/material.dart';

import 'package:design_system/tokens/typography.dart';

ThemeData lightTheme = ThemeData(
  colorSchemeSeed: Colors.purple[600],
  brightness: Brightness.light,
  typography: Typography.material2021(
    black: DesignSystemTypography.appMaterialTextLightTheme,
    white: DesignSystemTypography.appMaterialTextDarkTheme,
    englishLike: DesignSystemTypography.appMaterialEnglishLikeTextTheme,
    dense: DesignSystemTypography.appMaterialDensetextTheme,
    tall: DesignSystemTypography.appMaterialTallTextTheme,
  ),
);
