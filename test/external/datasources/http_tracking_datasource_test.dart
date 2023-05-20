import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ratracks/core/http/http_client.dart';
import 'package:ratracks/domain/entities/enums/transporter_enum.dart';
import 'package:ratracks/domain/errors/exceptions.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/external/datasources/endpoints.dart';
import 'package:ratracks/external/datasources/http_tracking_datasource.dart';
import 'package:ratracks/infra/datasources/tracking_datasource.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late TrackingDatasource datasource;
  late HttpClient httpClient;

  setUp(() {
    httpClient = HttpClientMock();
    datasource = HttpTrackingDatasource(httpClient: httpClient);
  });

  group('Create', () {
    final expectedUrl = Endpoints.createTracking();

    void successMock() {
      when(() => httpClient.post(any()))
          .thenAnswer((_) async => HttpResponse(data: {}, statusCode: 200));
    }

    test('should call post method with correct url', () async {
      successMock();

      await datasource.create(CreateTrackingParams(
          trackingCode: '123456', transporter: Transporter.correios));

      verify(() => httpClient.post(expectedUrl)).called(1);
    });

    test('should throw a ServerException when the call is unsuccessful',
        () async {
      when(() => httpClient.post(any())).thenAnswer((_) async => HttpResponse(
            data: 'Something went wrong',
            statusCode: 400,
          ));

      final call = datasource.create(CreateTrackingParams(
          trackingCode: '123456', transporter: Transporter.correios));

      expect(() => call, throwsA(ServerException()));
    });
  });
}
