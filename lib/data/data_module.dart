import 'package:http/http.dart' as http;
import 'package:imgur_gallery/data/gallery/gallery_repository.dart';
import 'package:imgur_gallery/environment.dart';
import 'package:provider/provider.dart';

import 'source/remote/api.dart';

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: _createHttpClient())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<http.Client, Api>(
    builder: (context, httpClient, api) => Api(httpClient, environment.baseUrl),
  ),
  ProxyProvider<Api, GalleryRepository>(
    builder: (context, api, _) => GalleryRepository(api),
  )
];

http.Client _createHttpClient() {
  return http.Client();
}
