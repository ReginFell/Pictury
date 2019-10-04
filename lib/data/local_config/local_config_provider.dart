import 'dart:async';

import 'package:pictury/data/preferences/preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class LocalConfigProvider {
  static const String isCategorySelectedPref = "isCategorySelected";
  static const String isDarkThemeEnabled = "isDarkThemeEnabled";

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

  Future<void> setDarkThemeEnabled(bool selected) async {
    print("selected $selected");
    (await _consume()).setBool(isDarkThemeEnabled, selected);
  }

  Future<bool> isCategorySelected() async {
    return (await _consume())
        .getBool(isCategorySelectedPref, defaultValue: false)
        .first;
  }

  Stream<bool> observeThemeState() async* {
    final preference = await _consume();
    yield* preference.getBool(isDarkThemeEnabled, defaultValue: true);
  }
}
