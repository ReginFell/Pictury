import 'package:flutter/material.dart';

enum AppTheme { LIGHT, DARK }

class MaterialThemeProvider {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: Colors.amberAccent,
      accentColor: Colors.amber,
      fontFamily: "Sans",
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xFFF6FFFF));

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    fontFamily: "Sans",
    brightness: Brightness.dark,
  );

  static ThemeData getThemeFromKey(AppTheme theme) {
    switch (theme) {
      case AppTheme.LIGHT:
        return lightTheme;
      case AppTheme.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
