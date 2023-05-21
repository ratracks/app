import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ratracks/core/http/http_client.dart';
import 'package:ratracks/domain/errors/exceptions.dart';
import 'package:ratracks/external/datasources/endpoints.dart';
import 'package:ratracks/external/datasources/http_user_datasource.dart';
import 'package:ratracks/infra/datasources/user_datasource.dart';

import '../../utils/factories/mock_user_factory.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late UserDatasource datasource;
  late HttpClient httpClient;

  setUp(() {
    httpClient = HttpClientMock();
    datasource = HttpUserDatasource(httpClient: httpClient);
  });

  group('Create Anonymous User', () {
    final expectedUrl = Endpoints.anonymousUser();

    void successMock() {
      when(() => httpClient.post(any())).thenAnswer((_) async =>
          HttpResponse(data: MockUser.makeReceivingJson(), statusCode: 201));
    }

    test('should call post method with correct url', () async {
      successMock();

      await datasource.createAnonymousUser();

      verify(() => httpClient.post(expectedUrl)).called(1);
    });

    test('should return an user entity when successful', () async {
      successMock();

      final result = await datasource.createAnonymousUser();

      expect(result, MockUser.makeEntity());
    });

    test('should throw a ServerException when the call is unsuccessful', () async {
      when(() => httpClient.post(any())).thenAnswer((_) async => HttpResponse(
            data: 'Something went wrong',
            statusCode: 400,
          ));

      final call = datasource.createAnonymousUser();

      expect(() => call, throwsA(ServerException()));
    });
  });
}
