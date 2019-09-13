import 'package:flutter/material.dart';

enum AppTheme { LIGHT, DARK }

class MaterialThemeProvider {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: Colors.amberAccent,
      accentColor: Colors.amber,
      fontFamily: "Sans",
      brightness: Brightness.light,
      primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
      scaffoldBackgroundColor: Colors.white);

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
