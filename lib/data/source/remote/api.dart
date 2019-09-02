import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imgur_gallery/data/client/access_key_client.dart';
import 'package:imgur_gallery/data/gallery/models/section.dart';
import 'package:imgur_gallery/data/gallery/models/sort.dart';

import 'models/image_response.dart';

class Api {
  final String _baseUrl;
  final AccessKeyClient _imgurClient;

  Api(this._imgurClient, this._baseUrl);

  FutureOr<List<ImageResponse>> loadGallery(
      Section section, Sort sort, int page) async {
    http.Response response =
        await _imgurClient.get("$_baseUrl/photos?page=$page");

    final List<dynamic> parsedJson = json.decode(response.body);

    return parsedJson.map((value) => ImageResponse.fromJson(value)).toList();
  }
}
