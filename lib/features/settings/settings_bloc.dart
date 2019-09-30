import 'dart:math';

import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:pictury/features/settings/settings_event.dart';
import 'package:pictury/features/settings/settings_view_state.dart';

class SettingsBloc extends BaseBloc<SettingsViewState, SettingsEvent> {
  final LocalConfigProvider _localConfigProvider;

  SettingsBloc(this._localConfigProvider) {
    _localConfigProvider
        .observeThemeState()
        .listen((value) => dispatch(ChangeThemeEvent(value)));
  }

  @override
  SettingsViewState get initialState => SettingsViewState.createDefault();

  @override
  Stream<SettingsViewState> mapEventToState(SettingsEvent event) async* {
    yield* event.when(
      changeThemeEvent: _changeTheme,
      themeChangedEvent: _themeChanged,
    );
  }

  void _changeTheme(ChangeThemeEvent event) async {
    _localConfigProvider.setDarkThemeEnabled(event.isDarkThemeEnabled);
  }

  Stream<SettingsViewState> _themeChanged(ThemeChangedEvent event) async* {
    yield currentState
        .rebuild((b) => b.isDarkThemeEnabled = event.isDarkThemeEnabled);
  }
}
