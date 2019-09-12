import 'package:flutter/material.dart';
import 'package:pictury/features/categories/categories_screen.dart';
import 'package:pictury/features/gallery_details/gallery_details_screen.dart';
import 'package:pictury/features/home/home_screen.dart';
import 'package:pictury/features/search/search_screen.dart';
import 'package:pictury/features/splash/splash_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case CategoriesScreen.route:
        return MaterialPageRoute(builder: (_) {
          if (settings.arguments != null) {
            return CategoriesScreen(isInitial: settings.arguments);
          } else {
            return CategoriesScreen();
          }
        });
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case SearchScreen.route:
        return MaterialPageRoute(builder: (_) => SearchScreen());
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
