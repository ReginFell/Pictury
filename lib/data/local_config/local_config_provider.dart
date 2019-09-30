import 'dart:async';

import 'package:pictury/data/preferences/preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class LocalConfigProvider {
  static const String isCategorySelectedPref = "isCategorySelected";
  static const String isDarkThemeEnabled = "isDarkThemeEnabled";

  final Preferences _preferences;

  LocalConfigProvider(this._preferences);

  Future<StreamingSharedPreferences> consume() async {
    return await _preferences.sharedPreferences;
  }

  void setCategorySelected(bool selected) async {
    (await consume()).setBool(isCategorySelectedPref, selected);
  }

  void setDarkThemeEnabled(bool selected) async {
    (await consume()).setBool(isDarkThemeEnabled, selected);
  }

  Future<bool> isCategorySelected() {
    return consume().then((prefs) =>
        prefs.getBool(isCategorySelectedPref, defaultValue: false).first);
  }

  Stream<bool> observeThemeState() async* {
    final preference = await consume();
    yield* preference.getBool(isDarkThemeEnabled, defaultValue: false);
  }
}
