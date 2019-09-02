import 'package:flutter/material.dart';
import 'package:unsplash_gallery/features/gallery_details/gallery_details_screen.dart';
import 'package:unsplash_gallery/features/home/home_screen.dart';
import 'package:unsplash_gallery/features/splash/splash_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case GalleryDetailsScreen.route:
        return MaterialPageRoute(
            builder: (_) => GalleryDetailsScreen(settings.arguments));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
