import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:imgur_gallery/injection/providers.dart';
import 'package:imgur_gallery/router.dart';
import 'package:imgur_gallery/theme_provider.dart';
import 'package:provider/provider.dart';

import 'app_localization.dart';
import 'environment.dart';

void main() {
  BuildEnvironment.init(
      flavor: BuildFlavor.all,
      baseUrl: 'https://api.imgur.com',
      clientId: '60fcba1c69916d0',
      supportedTypes: ["jpg", "png", "gif"]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: PlatformApp(
        supportedLocales: [
          Locale('en', 'US'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        android: (_) => MaterialAppData(
          theme: ThemeProvider.lightTheme,
          darkTheme: ThemeProvider.darkTheme,
          onGenerateRoute: Router.generateRoute,
        ),
      ),
    );
  }
}
