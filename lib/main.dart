import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:imgur_gallery/injection/providers.dart';
import 'package:imgur_gallery/router.dart';
import 'package:provider/provider.dart';

import 'environment.dart';

void main() {
  BuildEnvironment.init(
    flavor: BuildFlavor.all,
    baseUrl: 'https://api.imgur.com',
    clientId: '60fcba1c69916d0',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: PlatformApp(
        debugShowCheckedModeBanner: false,
        title: 'Imgur gallery',
        android: (_) => MaterialAppData(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
