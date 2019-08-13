import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/image_response.dart';

class Api {
  final String _baseUrl;
  final http.Client _client;

  Api(this._client, this._baseUrl);

  Future<ImageResponse> loadGallery() async {
    http.Response response = await _client.get("$_baseUrl/additive/.json");

    Map data = json.decode(response.body);

    return ImageResponse();
  }
}
