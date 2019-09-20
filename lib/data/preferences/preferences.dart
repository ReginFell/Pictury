import 'dart:async';

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class Preferences {
  final FutureOr<StreamingSharedPreferences> sharedPreferences;

  Preferences(this.sharedPreferences);
}
