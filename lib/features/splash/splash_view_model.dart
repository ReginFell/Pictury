import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:imgur_gallery/features/home/home_screen.dart';

class SplashViewModel extends ChangeNotifier {
  Future startSplash(BuildContext context) async {
    Timer(Duration(seconds: 1), _onFinishSplash(context));
  }

  _onFinishSplash(BuildContext context) async {
    Navigator.pushNamed(context, HomeScreen.route);
  }
}
