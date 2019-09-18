import 'dart:async';

import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:pictury/features/splash/splash_event.dart';
import 'package:pictury/features/splash/splash_view_state.dart';

class SplashBloc extends BaseBloc<SplashViewState, SplashEvent> {
  static const int splashDuration = 0;

  final LocalConfigProvider _localConfigProvider;

  SplashBloc(this._localConfigProvider);

  @override
  get initialState => SplashViewState.createDefault();

  @override
  Stream<SplashViewState> mapEventToState(SplashEvent event) async* {
    yield* event.when(
      startSplashEvent: (event) => _startSplash(),
      endSplashEvent: null,
    );
  }

  Stream<SplashViewState> _startSplash() async* {
    await Future.delayed(Duration(seconds: splashDuration));
    final bool isCategorySelected =
        await _localConfigProvider.isCategorySelected();

    yield currentState.rebuild((b) => b
      ..isSplashActive = false
      ..isCategoriesSelected = isCategorySelected);
  }
}
