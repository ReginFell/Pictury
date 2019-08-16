import 'package:http/http.dart' as http;

class ImgurClient extends http.BaseClient {
  final http.Client _httpClient = new http.Client();
  final Map<String, String> headers;

  ImgurClient({this.headers});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(headers);
    return _httpClient.send(request);
  }
}
