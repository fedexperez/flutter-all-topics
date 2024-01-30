import 'package:flutter/material.dart';

import 'package:design_system/tokens/typography.dart';

ThemeData darkTheme = ThemeData(
  colorSchemeSeed: Colors.purple[600],
  brightness: Brightness.dark,
  typography: Typography.material2021(
    black: DesignSystemTypography.appMaterialTextLightTheme,
    white: DesignSystemTypography.appMaterialTextDarkTheme,
    englishLike: DesignSystemTypography.appMaterialEnglishLikeTextTheme,
    dense: DesignSystemTypography.appMaterialDensetextTheme,
    tall: DesignSystemTypography.appMaterialTallTextTheme,
  ),
);
