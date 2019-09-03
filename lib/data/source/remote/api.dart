import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pictury/data/client/access_key_client.dart';

import 'models/image_response.dart';

class Api {
  final String _baseUrl;
  final AccessKeyClient _accessKeyClient;

  Api(this._accessKeyClient, this._baseUrl);

  FutureOr<List<ImageResponse>> loadGallery(int page) async {
    http.Response response =
        await _accessKeyClient.get("$_baseUrl/photos?page=$page&per_page=30");

    final List<dynamic> parsedJson = json.decode(response.body);

    return parsedJson.map((value) => ImageResponse.fromJson(value)).toList();
  }
}
