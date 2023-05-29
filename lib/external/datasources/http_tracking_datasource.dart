import 'dart:convert';
import 'dart:math';

import 'package:ratracks/core/http/http_client.dart';
import 'package:ratracks/domain/entities/tracking_entity.dart';
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

    Map body = {
      'productName': params.productName,
      'trackingCode': params.trackingCode,
      'userId': params.userId,
    };

    final response = await httpClient.post(url, body: json.encode(body));

    if (response.statusCode == 200) {
      return;
    } else {
      throw ServerException(json.decode(response.data)['error']);
    }
  }

  @override
  Future<List<TrackingEntity>> getTrackings(GetTrackingsParams params) async {
    final url = Endpoints.getTrackings(params.userId, params.status);

    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      log(response.data);

      return [];
    } else {
      throw ServerException(json.decode(response.data)['error']);
    }
  }
}
