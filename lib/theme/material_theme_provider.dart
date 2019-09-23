import 'package:pictury/theme/app_theme.dart';
import 'package:pictury/theme/material_theme.dart';

enum ThemeMode { LIGHT, DARK }

class MaterialThemeProvider {
  static final AppTheme lightTheme = MaterialThemeLight();

  static final AppTheme darkTheme = MaterialThemeLight();

  AppTheme getThemeFromKey(ThemeMode theme) {
    switch (theme) {
      case ThemeMode.LIGHT:
        return lightTheme;
      case ThemeMode.DARK:
        return lightTheme;
      default:
        return lightTheme;
    }
  }
}
