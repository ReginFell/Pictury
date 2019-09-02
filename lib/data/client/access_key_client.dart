import 'package:http/http.dart' as http;

class AccessKeyClient extends http.BaseClient {
  final http.Client _httpClient = new http.Client();
  final Map<String, String> headers;

  AccessKeyClient({this.headers});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(headers);
    return _httpClient.send(request);
  }
}
