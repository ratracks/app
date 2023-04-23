import 'package:http/http.dart' as http;
import 'package:ratracks/core/http/http_client.dart';

class HttpClientImplementation implements HttpClient {
  final client = http.Client();

  @override
  Future<HttpResponse> post(String url) async {
    final response = await client.post(Uri.parse(url));

    return HttpResponse(
      data: response.body, 
      statusCode: response.statusCode,
    );
  }
}