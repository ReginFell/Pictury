import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pictury/core/ui/base/base_view_model.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:pictury/features/categories/categories_screen.dart';
import 'package:pictury/features/home/home_screen.dart';

class SplashViewModel extends BaseViewModel {
  static const int splashDuration = 0;

  final LocalConfigProvider _localConfigProvider;

  SplashViewModel(this._localConfigProvider);

  Future startSplash(BuildContext context) async {
    Timer(Duration(seconds: splashDuration), () async {
      if (await _localConfigProvider.isCategorySelected()) {
        Navigator.pushReplacementNamed(context, HomeScreen.route);
      } else {
        Navigator.pushReplacementNamed(context, CategoriesScreen.route);
      }
    });
  }

  @override
  initialViewState() => null;
}
