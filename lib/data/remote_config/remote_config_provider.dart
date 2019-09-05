import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigProvider {
  final FutureOr<RemoteConfig> _remoteConfig;

  RemoteConfigProvider(this._remoteConfig);

  Future<RemoteConfig> consume() async {
    final RemoteConfig config = await _remoteConfig;

    await config.fetch(expiration: const Duration(seconds: 1));
    await config.activateFetched();
    return config;
  }
}
