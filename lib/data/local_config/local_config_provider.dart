import 'dart:async';

import 'package:pictury/data/source/local/preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class LocalConfigProvider {
  static const String isCategorySelectedPref = "isCategorySelected";

  final Preferences _preferences;

  LocalConfigProvider(this._preferences);

  Future<StreamingSharedPreferences> consume() async {
    return await _preferences.sharedPreferences;
  }

  void setCategorySelected(bool selected) async {
    (await consume()).setBool(isCategorySelectedPref, selected);
  }

  Future<bool> isCategorySelected() {
    return consume().then((prefs) =>
        prefs.getBool(isCategorySelectedPref, defaultValue: false).first);
  }
}
