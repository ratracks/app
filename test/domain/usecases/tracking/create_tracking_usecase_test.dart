import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ratracks/domain/entities/enums/transporter_enum.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/domain/usecases/tracking/create_tracking_usecase.dart';
import 'package:ratracks/domain/usecases/usecase.dart';
import 'package:ratracks/domain/usecases/user/create_anonymous_user_usecase.dart';

import '../../../utils/factories/mock_user_factory.dart';

class MockedTrackingRepository extends Mock implements TrackingRepository {}

void main() {
  late CreateTrackingUsecase usecase;
  late TrackingRepository repository;

  var params = CreateTrackingParams(trackingCode: "Mock Code", transporter: Transporter.correios);

  setUp(() {
    repository = MockedTrackingRepository();
    usecase = CreateTrackingUsecase(repository: repository);

    registerFallbackValue(params);
  });

  void successMock() {
    when(() => repository.createTracking(any()))
      .thenAnswer((_) async => const Right(null));
  }

  void failureMock() {
    when(() => repository.createTracking(any()))
      .thenAnswer((_) async => Left(ServerFailure()));
  }

  test('should call the repository', () async {
    successMock();

    await usecase(params);

    verify(() => repository.createTracking(params)).called(1);
  });

  test('should return a failure when something went wrong', () async {
    failureMock();

    final result = await usecase(params);

    expect(result, Left(ServerFailure()));
  });
}