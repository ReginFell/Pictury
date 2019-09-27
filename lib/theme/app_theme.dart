import 'package:flutter/material.dart';

abstract class AppTheme {

  Brightness brightness;

  Color get colorAccent;

  Color get primaryColor;

  Color get iconColor;

  Color get searchIconColor;

  Color get textColor;

  Color get bottomBarBackgroundColor;

  Color get bottomBarElementColor;

  Color get searchBarColor;

  Color get appBarBackgroundColor;

  double get searchBarCornerRadius;

  ThemeData get themeData;
}
