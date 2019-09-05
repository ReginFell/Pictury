import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_widget.dart';
import 'package:pictury/features/splash/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String route = '/';

  SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashViewModel>(
      model: SplashViewModel(Provider.of(context)),
      onModelReady: (model) => model.startSplash(context),
      builder: (context, model, child) => PlatformScaffold(
          body: Container(
        child: Row(
          children: <Widget>[],
        ),
      )),
    );
  }
}
