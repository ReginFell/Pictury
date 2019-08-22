import 'dart:async';

import 'package:imgur_gallery/data/client/imgur_client.dart';
import 'package:imgur_gallery/data/gallery/gallery_repository.dart';
import 'package:imgur_gallery/data/source/local/preferences.dart';
import 'package:imgur_gallery/environment.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'source/remote/api.dart';

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: _createHttpClient()),
  Provider.value(value: _createSharedPreferences())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<ImgurClient, Api>(
    builder: (context, imgurClient, api) =>
        Api(imgurClient, environment.baseUrl),
  ),
  ProxyProvider<Api, GalleryRepository>(
    builder: (context, api, _) => GalleryRepository(api),
  ),
  ProxyProvider<FutureOr<SharedPreferences>, Preferences>(
    builder: (context, sharedPreferences, _) => Preferences(sharedPreferences),
  )
];

ImgurClient _createHttpClient() {
  final Map<String, String> headers = {
    "Authorization": "Client-ID ${environment.clientId}"
  };

  return ImgurClient(headers: headers);
}

FutureOr<SharedPreferences> _createSharedPreferences() {
  return SharedPreferences.getInstance();
}
