import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imgur_gallery/data/client/imgur_client.dart';

import 'models/image_response.dart';

class Api {
  final String _baseUrl;
  final ImgurClient _imgurClient;

  Api(this._imgurClient, this._baseUrl);

  // /3/gallery/{section}/{page}
  Future<ImageResponse> loadGallery(String section, int page) async {
    http.Response response =
        await _imgurClient.get("$_baseUrl/3/gallery/$section/$page");

    final parsedJson = json.decode(response.body);
    return ImageResponse.fromJson(parsedJson);
  }
}
