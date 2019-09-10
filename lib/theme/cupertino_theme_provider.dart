import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppTheme { LIGHT, DARK }

class CupertinoThemeProvider {
  static final CupertinoThemeData lightTheme = CupertinoThemeData(
      primaryColor: Colors.grey, scaffoldBackgroundColor: Color(0xFFF6FFFF));

  static final CupertinoThemeData darkTheme = CupertinoThemeData(
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
  );

  static CupertinoThemeData getThemeFromKey(AppTheme theme) {
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
