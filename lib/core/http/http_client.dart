abstract class HttpClient {
  Future<HttpResponse> post(String url, { String? body });
  Future<HttpResponse> get(String url);
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({ required this.data, required this.statusCode });
}