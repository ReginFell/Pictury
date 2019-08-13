import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:imgur_gallery/features/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
        title: 'Imgur gallery',
        android: (_) => MaterialAppData(
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            ),
        routes: {
          '/': (context) => SplashScreen(),
        });
  }
}
