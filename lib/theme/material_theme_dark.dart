import 'package:flutter/material.dart';
import 'package:pictury/theme/app_theme.dart';

class MaterialThemeDark extends AppTheme {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get colorAccent => Colors.amber;

  @override
  Color get primaryColor => Colors.amberAccent;

  @override
  Color get iconColor => Colors.white;

  @override
  Color get searchIconColor => Colors.white;

  @override
  Color get textColor => Colors.black;

  @override
  Color get bottomBarBackgroundColor => Color(0xFF4D4D4D).withOpacity(0.95);

  @override
  Color get bottomBarElementColor => Colors.white;

  @override
  Color get searchBarColor => Colors.grey.withOpacity(0.2);

  @override
  Color get appBarBackgroundColor => Color(0xFF4D4D4D).withOpacity(0.95);

  @override
  double get searchBarCornerRadius => 10.0;

  @override
  ThemeData get themeData => ThemeData(
        iconTheme: IconThemeData(color: iconColor),
        primaryColor: primaryColor,
        accentColor: colorAccent,
        fontFamily: "Sans",
        brightness: brightness,
        primaryTextTheme: TextTheme(title: TextStyle(color: textColor)),
      );
}
