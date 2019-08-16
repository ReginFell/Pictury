import 'package:imgur_gallery/data/client/imgur_client.dart';
import 'package:imgur_gallery/data/gallery/gallery_repository.dart';
import 'package:imgur_gallery/environment.dart';
import 'package:provider/provider.dart';

import 'source/remote/api.dart';

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: _createHttpClient())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<ImgurClient, Api>(
    builder: (context, imgurClient, api) => Api(imgurClient, environment.baseUrl),
  ),
  ProxyProvider<Api, GalleryRepository>(
    builder: (context, api, _) => GalleryRepository(api),
  )
];

ImgurClient _createHttpClient() {
  final Map<String, String> headers = {
    "Authorization": "Client-ID ${environment.clientId}"
  };

  return ImgurClient(headers: headers);
}
