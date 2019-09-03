import 'dart:async';

import 'package:pictury/data/client/access_key_client.dart';
import 'package:pictury/data/gallery/gallery_repository.dart';
import 'package:pictury/data/source/local/preferences.dart';
import 'package:pictury/environment.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'source/remote/api.dart';

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: _createHttpClient()),
  Provider.value(value: _createSharedPreferences())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<AccessKeyClient, Api>(
    builder: (context, accessKeyClient, api) =>
        Api(accessKeyClient, environment.baseUrl),
  ),
  ProxyProvider<Api, GalleryRepository>(
    builder: (context, api, _) => GalleryRepository(api),
  ),
  ProxyProvider<FutureOr<SharedPreferences>, Preferences>(
    builder: (context, sharedPreferences, _) => Preferences(sharedPreferences),
  )
];

AccessKeyClient _createHttpClient() {
  final Map<String, String> headers = {
    "Authorization": "Client-ID ${environment.accessKey}"
  };

  return AccessKeyClient(headers: headers);
}

FutureOr<SharedPreferences> _createSharedPreferences() {
  return SharedPreferences.getInstance();
}
