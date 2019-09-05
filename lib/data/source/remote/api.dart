import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pictury/data/client/access_key_client.dart';

import 'models/image_response.dart';

class Api {
  final String _baseUrl;
  final AccessKeyClient _accessKeyClient;

  Api(this._accessKeyClient, this._baseUrl);

  FutureOr<List<ImageResponse>> loadByQuery(String query, int page) async {
    http.Response response = await _accessKeyClient
        .get("$_baseUrl/search/photos?page=$page&query=$query&per_page=30");

    final dynamic parsedJson = json.decode(response.body);
    final SearchResponse searchResponse = SearchResponse.fromJson(parsedJson);

    return searchResponse.results;
  }
}
