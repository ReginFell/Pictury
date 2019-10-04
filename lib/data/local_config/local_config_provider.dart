import 'dart:async';

import 'package:pictury/data/preferences/preferences.dart';
import 'package:pictury/theme/theme_provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class LocalConfigProvider {
  static const String isCategorySelectedPref = "isCategorySelected";
  static const String darkThemeMode = "darkThemeMode";

  final Preferences _preferences;

  StreamingSharedPreferences _streamingSharedPreferences;

  LocalConfigProvider(this._preferences);

  FutureOr<StreamingSharedPreferences> _consume() async {
    if (_streamingSharedPreferences == null) {
      _streamingSharedPreferences = await _preferences.sharedPreferences;
    }
    return _streamingSharedPreferences;
  }

  void setCategorySelected(bool selected) async {
    (await _consume()).setBool(isCategorySelectedPref, selected);
  }

  void setDarkThemeEnabled(AppThemeMode themeMode) async {
    (await _consume()).setInt(darkThemeMode, themeMode.index);
  }

  Future<bool> isCategorySelected() async {
    return (await _consume())
        .getBool(isCategorySelectedPref, defaultValue: false)
        .first;
  }

  Stream<AppThemeMode> observeAppThemeMode() async* {
    final preference = await _consume();
    yield* preference
        .getInt(darkThemeMode, defaultValue: AppThemeMode.unspecified.index)
        .map((value) => AppThemeMode.values[value]);
  }
}
