import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:unsplash_gallery/injection/providers.dart';
import 'package:unsplash_gallery/router.dart';
import 'package:unsplash_gallery/theme/cupertino_theme_provider.dart';
import 'package:unsplash_gallery/theme/material_theme_provider.dart';
import 'package:provider/provider.dart';

import 'app_localization.dart';
import 'environment.dart';

void main() {
  BuildEnvironment.init(
      flavor: BuildFlavor.all,
      baseUrl: 'https://api.unsplash.com/',
      accessKey:
          '7901b0a91d93ee491a49c7ff93e0a24fa7a7cff5d26c1d53b21a51e1960ac018',
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
        onGenerateRoute: Router.generateRoute,
        android: (_) => MaterialAppData(
          theme: MaterialThemeProvider.lightTheme,
          darkTheme: MaterialThemeProvider.darkTheme,
        ),
        ios: (_) => CupertinoAppData(theme: CupertinoThemeProvider.lightTheme),
      ),
    );
  }
}
