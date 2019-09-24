import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'client/access_key_client.dart';
import 'models/image_response.dart';

class Api {
  final String _baseUrl;
  final AccessKeyClient _accessKeyClient;

  Api(this._accessKeyClient, this._baseUrl);

  Future<List<ImageResponse>> loadByQuery(String query, int page,
      {int perPage = 30}) async {
    http.Response response = await _accessKeyClient.get(
        "$_baseUrl/search/photos?page=$page&query=$query&per_page=$perPage");

    var parsedJson = await compute(_parseResult, response.body);
    final SearchResponse searchResponse = SearchResponse.fromJson(parsedJson);

    return searchResponse.results;
  }

  static _parseResult(String body) {
    return json.decode(body);
  }
}
