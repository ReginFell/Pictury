import 'package:http/http.dart' as http;

class AccessKeyClient extends http.BaseClient {
  final http.Client _httpClient = new http.Client();
  final Map<String, String> headers;

  AccessKeyClient({this.headers});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers.addAll(headers);
    _logRequest(request);
    final result = await _httpClient.send(request);
    _logResponse(result);
    return result;
  }

  _logRequest(request) {
    print(request);
  }

  _logResponse(request) {
    print(request);
  }
}
