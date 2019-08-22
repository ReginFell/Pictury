import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  final FutureOr<SharedPreferences> sharedPreferences;

  Preferences(this.sharedPreferences);
}
