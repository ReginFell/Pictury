import 'package:flutter/material.dart';
import 'package:pictury/theme/app_theme.dart';

import 'app_theme_dark.dart';
import 'app_theme_light.dart';

enum AppThemeMode { unspecified, light, dark }

class ThemeProvider {
  static final AppTheme lightTheme = AppThemeLight();

  static final AppTheme darkTheme = AppThemeDark();

  final AppThemeMode appThemeMode;

  ThemeProvider(this.appThemeMode);

  AppTheme getThemeFromKey(BuildContext context) {
    if (appThemeMode == AppThemeMode.unspecified) {
      switch (_extractBrightness(context)) {
        case Brightness.light:
          return lightTheme;
        case Brightness.dark:
          return darkTheme;
        default:
          return lightTheme;
      }
    } else if (appThemeMode == AppThemeMode.light) {
      return lightTheme;
    } else {
      return darkTheme;
    }
  }

  static Brightness _extractBrightness(BuildContext context) {
    try {
      return MediaQuery.of(context).platformBrightness;
    } catch (e) {
      return Brightness.light;
    }
  }
}
