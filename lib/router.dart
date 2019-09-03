import 'package:flutter/material.dart';
import 'package:pictury/features/categories/categories_screen.dart';
import 'package:pictury/features/gallery_details/gallery_details_screen.dart';
import 'package:pictury/features/home/home_screen.dart';
import 'package:pictury/features/splash/splash_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case CategoriesScreen.route:
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
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
