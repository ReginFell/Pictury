import 'package:flutter/material.dart';
import 'package:pictury/theme/app_theme.dart';

class MaterialThemeLight extends AppTheme {
  @override
  Color get iconColor => Colors.black;

  @override
  Color get textColor => Colors.black;

  @override
  Color get bottomBarBackgroundColor => Colors.white;

  @override
  Color get searchBarColor => Colors.grey;

  @override
  double get searchBarCornerRadius => 15.0;

  @override
  ThemeData get themeData => ThemeData(
        iconTheme: IconThemeData(color: iconColor),
        primaryColor: Colors.amberAccent,
        accentColor: Colors.amber,
        fontFamily: "Sans",
        brightness: Brightness.light,
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
      );
}
