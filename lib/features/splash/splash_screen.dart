import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:imgur_gallery/core/ui/base/base_widget.dart';
import 'package:imgur_gallery/features/splash/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  static const String route = '/';

  SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SplashViewModel>(
      model: new SplashViewModel(),
      onModelReady: (model) => model.startSplash(context),
      builder: (context, model, child) => PlatformScaffold(
        body: PlatformText("Hello"),
      ),
    );
  }
}
