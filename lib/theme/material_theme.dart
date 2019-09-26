import 'package:flutter/material.dart';
import 'package:pictury/theme/app_theme.dart';

class MaterialThemeLight extends AppTheme {
  @override
  Color get iconColor => Colors.black;

  @override
  Color get searchIconColor => Colors.white;

  @override
  Color get textColor => Colors.black;

  @override
  Color get bottomBarBackgroundColor => Colors.white;

  @override
  Color get searchBarColor => Colors.grey.withOpacity(0.2);

  @override
  Color get appBarBackgroundColor => Color(0xFF4D4D4D).withOpacity(0.95);

  @override
  double get searchBarCornerRadius => 10.0;

  @override
  ThemeData get themeData => ThemeData(
        iconTheme: IconThemeData(color: iconColor),
        primaryColor: Colors.amberAccent,
        accentColor: Colors.amber,
        fontFamily: "Sans",
        brightness: Brightness.dark,
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
      );
}
