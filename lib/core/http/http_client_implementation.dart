import 'package:http/http.dart' as http;
import 'package:ratracks/core/http/http_client.dart';

class HttpClientImplementation implements HttpClient {
  final client = http.Client();

  @override
  Future<HttpResponse> post(String url, { String? body }) async {
    final response = await client.post(Uri.parse(url), body: body, headers: {
      'content-type': 'application/json',
    });

    return HttpResponse(
      data: response.body, 
      statusCode: response.statusCode,
    );
  }
  
  @override
  Future<HttpResponse> get(String url) async {
    final response = await client.get(Uri.parse(url), headers: {
      'content-type': 'application/json',
    });

    return HttpResponse(
      data: response.body, 
      statusCode: response.statusCode,
    );
  }
}