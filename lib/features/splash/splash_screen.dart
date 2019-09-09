import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/features/categories/categories_screen.dart';
import 'package:pictury/features/home/home_screen.dart';
import 'package:pictury/features/splash/splash_bloc.dart';
import 'package:pictury/features/splash/splash_event.dart';
import 'package:pictury/features/splash/splash_view_state.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String route = '/';

  SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider<SplashBloc, SplashViewState>(
      bloc: SplashBloc(Provider.of(context)),
      onBlocReady: (model) => model.dispatch(StartSplashEvent()),
      stateListener: (state) {
        if (!state.isSplashActive) {
          if (state.isCategoriesSelected) {
            Navigator.pushReplacementNamed(context, HomeScreen.route);
          } else {
            Navigator.pushReplacementNamed(context, CategoriesScreen.route);
          }
        }
      },
      builder: (context, model) => PlatformScaffold(
          body: Container(
        child: Row(
          children: <Widget>[Text("HI")],
        ),
      )),
    );
  }
}
