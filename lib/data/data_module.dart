import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:pictury/data/category/category_repository.dart';
import 'package:pictury/data/client/access_key_client.dart';
import 'package:pictury/data/gallery/gallery_repository.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:pictury/data/remote_config/remote_config_provider.dart';
import 'package:pictury/data/source/local/preferences.dart';
import 'package:pictury/environment.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'source/remote/api.dart';

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: _createHttpClient()),
  Provider.value(value: _createSharedPreferences()),
  Provider.value(value: _createRemoteConfig()),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<AccessKeyClient, Api>(
    builder: (context, accessKeyClient, api) =>
        Api(accessKeyClient, environment.baseUrl),
  ),
  ProxyProvider<Api, GalleryRepository>(
    builder: (context, api, _) => GalleryRepository(api),
  ),
  ProxyProvider<FutureOr<RemoteConfig>, RemoteConfigProvider>(
    builder: (context, remoteConfig, _) => RemoteConfigProvider(remoteConfig),
  ),
  ProxyProvider<FutureOr<StreamingSharedPreferences>, Preferences>(
    builder: (context, sharedPreferences, _) => Preferences(sharedPreferences),
  ),
  ProxyProvider<Preferences, LocalConfigProvider>(
    builder: (context, preferences, _) => LocalConfigProvider(preferences),
  ),
  ProxyProvider2<LocalConfigProvider, RemoteConfigProvider, CategoryRepository>(
    builder: (context, localConfigProvider, remoteConfigProvider, _) =>
        CategoryRepository(localConfigProvider, remoteConfigProvider),
  )
];

AccessKeyClient _createHttpClient() {
  final Map<String, String> headers = {
    "Authorization": "Client-ID ${environment.accessKey}"
  };

  return AccessKeyClient(headers: headers);
}

FutureOr<StreamingSharedPreferences> _createSharedPreferences() {
  return StreamingSharedPreferences.instance;
}

FutureOr<RemoteConfig> _createRemoteConfig() {
  return RemoteConfig.instance;
}
