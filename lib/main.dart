import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/widget/theme/theme_observer.dart';
import 'package:pictury/features/splash/splash_screen.dart';
import 'package:pictury/injection/providers.dart';
import 'package:pictury/router.dart';
import 'package:pictury/theme/app_theme.dart';
import 'package:pictury/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'app_localization.dart';
import 'environment.dart';

void main() {
  BuildEnvironment.init(
      flavor: BuildFlavor.all,
      baseUrl: 'https://api.unsplash.com',
      accessKey:
          '7901b0a91d93ee491a49c7ff93e0a24fa7a7cff5d26c1d53b21a51e1960ac018',
      supportedTypes: ["jpg", "png", "gif"]);
  runApp(PicturyApp());
}

class PicturyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));

    return MultiProvider(
      providers: providers,
      child: ThemeObserver(
        builder: (context, appThemeMode) {
          return Provider.value(
              value: ThemeProvider(appThemeMode),
              child: PlatformApp(
                home: SplashScreen(),
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
                android: (context) {
                  final ThemeProvider themeProvider = Provider.of(context);

                  return MaterialAppData(
                    theme: themeProvider.getThemeFromKey(context).themeData,
                  );
                },
                ios: (_) => CupertinoAppData(
                    theme: ThemeProvider.lightTheme.cupertinoAppData),
              ));
        },
      ),
    );
  }
}
