import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/ui/base/base_view_model.dart';
import 'package:unsplash_gallery/features/home/home_screen.dart';

class SplashViewModel extends BaseViewModel {
  static const int splashDuration = 0;

  Future startSplash(BuildContext context) async {
    Timer(Duration(seconds: splashDuration),
        () => Navigator.pushReplacementNamed(context, HomeScreen.route));
  }

  @override
  initialViewState() => null;
}
