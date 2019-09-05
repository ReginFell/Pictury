import 'dart:convert';

import 'package:pictury/data/remote_config/models/category.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class CategoryAdapter extends PreferenceAdapter<List<Category>> {
  @override
  List<Category> getValue(SharedPreferences preferences, String key) {
    final value = preferences.getString(key);
    if (value == null) {
      return null;
    } else {
      final List<dynamic> decoded = json.decode(value);

      return decoded.map((value) => Category.fromJson(value)).toList();
    }
  }

  @override
  Future<bool> setValue(SharedPreferences preferences, String key, value) {
    return preferences.setString(key, jsonEncode(value));
  }
}
