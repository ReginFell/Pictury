import 'dart:async';
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:pictury/data/remote_config/models/category.dart';

class RemoteConfigRepository {
  final FutureOr<RemoteConfig> _remoteConfig;

  RemoteConfigRepository(this._remoteConfig);

  Future<RemoteConfig> _fetch() async {
    final RemoteConfig config = await _remoteConfig;

    await config.fetch(expiration: const Duration(days: 1));
    await config.activateFetched();
    return config;
  }

  Future<List<Category>> loadCategories() {
    return _fetch().then((result) {
      final List<dynamic> parsedJson =
          json.decode(result.getString("categories"));

      return parsedJson.map((value) => Category.fromJson(value)).toList();
    });
  }
}
