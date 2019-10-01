import 'package:flutter/material.dart';
import 'package:pictury/theme/app_theme.dart';

import 'material_theme_dark.dart';
import 'material_theme_light.dart';

enum Theme { light, dark }

class MaterialThemeProvider {
  static ThemeMode themeMode;

  static final AppTheme lightTheme = MaterialThemeLight();

  static final AppTheme darkTheme = MaterialThemeDark();

  static AppTheme getThemeFromKey(
      BuildContext context, bool isDarkThemeEnabled) {
    switch (_extractBrightness(context)) {
      case Brightness.light:
        return darkTheme;
      case Brightness.dark:
        return darkTheme;
      default:
        return lightTheme;
    }
  }

  static Brightness _extractBrightness(BuildContext context) {
    return MediaQuery.of(context).platformBrightness;
  }
}
