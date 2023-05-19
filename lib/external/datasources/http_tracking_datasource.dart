import 'package:ratracks/core/http/http_client.dart';
import 'package:ratracks/domain/errors/exceptions.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/external/datasources/endpoints.dart';
import 'package:ratracks/infra/datasources/tracking_datasource.dart';

class HttpTrackingDatasource implements TrackingDatasource {
  final HttpClient httpClient;

  HttpTrackingDatasource({
    required this.httpClient,
  });

  @override
  Future<void> create(CreateTrackingParams params) async {
    final url = Endpoints.createTracking();

    try {
      final response = await httpClient.post(url);

      if (response.statusCode == 200) {
        return;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
