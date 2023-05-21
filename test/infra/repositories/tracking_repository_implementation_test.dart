import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ratracks/domain/entities/enums/transporter_enum.dart';
import 'package:ratracks/domain/errors/exceptions.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/infra/datasources/tracking_datasource.dart';
import 'package:ratracks/infra/repositories/tracking_repository_implementation.dart';

class MockedTrackingDatasource extends Mock implements TrackingDatasource {}

void main() {
  late TrackingRepository repository;
  late TrackingDatasource datasource;

  setUp(() {
    datasource = MockedTrackingDatasource();
    repository = TrackingRepositoryImplementation(datasource: datasource);

    registerFallbackValue(CreateTrackingParams(
      userId: '123',
      trackingCode: '123456',
      transporter: Transporter.correios,
    ));
  });

  group('createTracking', () {
    test('should call the datasource', () async {
      when(() => datasource.create(any())).thenAnswer((_) async => {});

      await repository.createTracking(CreateTrackingParams(
        userId: '123',
        trackingCode: '123456',
        transporter: Transporter.correios,
      ));

      verify(() => datasource.create(any())).called(1);
    });

    test(
        'should throw an ServerFailure when datasource throws a server exception',
        () async {
      when(() => datasource.create(any())).thenThrow(ServerException());

      var result = await repository.createTracking(CreateTrackingParams(
        userId: '123',
        trackingCode: '123456',
        transporter: Transporter.correios,
      ));

      expect(result, Left(ServerFailure()));
    });
  });
}
