import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:pictury/data/category/category_dao.dart';
import 'package:pictury/data/category/category_repository.dart';
import 'package:pictury/data/gallery/gallery_dao.dart';
import 'package:pictury/data/gallery/gallery_repository.dart';
import 'package:pictury/data/local_config/local_config_provider.dart';
import 'package:pictury/data/remote_config/remote_config_provider.dart';
import 'package:pictury/data/database/app_database.dart';
import 'package:pictury/data/preferences/preferences.dart';
import 'package:pictury/environment.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'api/api.dart';
import 'api/client/access_key_client.dart';

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: _createHttpClient()),
  Provider.value(value: _createSharedPreferences()),
  Provider.value(value: _createRemoteConfig()),
  Provider.value(value: _createDatabase()),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<AccessKeyClient, Api>(
    builder: (context, accessKeyClient, api) =>
        Api(accessKeyClient, environment.baseUrl),
  ),
  ProxyProvider<Future<AppDatabase>, Future<GalleryDao>>(
    builder: (context, database, _) =>
        database.then((database) => database.galleryDao),
  ),
  ProxyProvider<Future<AppDatabase>, Future<CategoryDao>>(
    builder: (context, database, _) =>
        database.then((database) => database.categoryDao),
  ),
  ProxyProvider2<Api, Future<GalleryDao>, GalleryRepository>(
    builder: (context, api, dao, _) => GalleryRepository(api, dao),
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
  ProxyProvider3<Api, Future<CategoryDao>, RemoteConfigProvider,
      CategoryRepository>(
    builder: (context, api, categoryDao, remoteConfigProvider, _) =>
        CategoryRepository(api, categoryDao, remoteConfigProvider),
  )
];

AccessKeyClient _createHttpClient() {
  final Map<String, String> headers = {
    "Authorization": "Client-ID ${environment.accessKey}"
  };

  return AccessKeyClient(headers: headers);
}

Future<AppDatabase> _createDatabase() async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}

FutureOr<StreamingSharedPreferences> _createSharedPreferences() {
  return StreamingSharedPreferences.instance;
}

FutureOr<RemoteConfig> _createRemoteConfig() {
  return RemoteConfig.instance;
}
