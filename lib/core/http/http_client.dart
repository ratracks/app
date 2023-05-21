abstract class HttpClient {
  Future<HttpResponse> post(String url, { String? body });
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({ required this.data, required this.statusCode });
}