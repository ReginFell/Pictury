import 'package:pictury/core/ui/base/base_bloc.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:pictury/features/settings/settings_event.dart';
import 'package:pictury/features/settings/settings_view_state.dart';
import 'package:pictury/theme/theme_provider.dart';

class SettingsBloc extends BaseBloc<SettingsViewState, SettingsEvent> {
  final LocalConfigProvider _localConfigProvider;
  final ThemeProvider _themeProvider;

  SettingsBloc(this._localConfigProvider, this._themeProvider) {
    _localConfigProvider
        .observeAppThemeMode()
        .listen((value) => dispatch(ThemeChangedEvent(value)));
  }

  @override
  SettingsViewState get initialState => SettingsViewState.createDefault();

  @override
  Stream<SettingsViewState> mapEventToState(SettingsEvent event) async* {
    print(event);
    if (event is ChangeThemeEvent) {
      _changeTheme(event);
    } else if (event is ThemeChangedEvent) {
      yield* _themeChanged(event);
    }
  }

  void _changeTheme(ChangeThemeEvent event) {
    _localConfigProvider.setDarkThemeEnabled(
      event.isDarkThemeEnabled ? AppThemeMode.dark : AppThemeMode.light,
    );
  }

  Stream<SettingsViewState> _themeChanged(ThemeChangedEvent event) async* {
    yield currentState.rebuild(
        (b) => b.isDarkThemeEnabled = event.appThemeMode == AppThemeMode.dark);
  }
}
