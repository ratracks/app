import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ratracks/domain/entities/enums/status_enum.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/domain/usecases/tracking/get_trackings_usecase.dart';

import '../../../utils/factories/mock_tracking_factory.dart';

class MockedTrackingRepository extends Mock implements TrackingRepository {}

void main() {
  late GetTrackingsUsecase usecase;
  late TrackingRepository repository;

  var params = GetTrackingsParams(status: Status.in_progress);

  setUp(() {
    repository = MockedTrackingRepository();
    usecase = GetTrackingsUsecase(repository: repository);

    registerFallbackValue(params);
  });

  void successMock() {
    when(() => repository.getTrackings(any())).thenAnswer((_) async =>
        Right([MockTracking.makeEntity(), MockTracking.makeEntity()]));
  }

  void failureMock() {
    when(() => repository.getTrackings(any()))
        .thenAnswer((_) async => Left(ServerFailure()));
  }

  test('should call the repository', () async {
    successMock();

    await usecase(params);

    verify(() => repository.getTrackings(params)).called(1);
  });

  test('should return a failure when something went wrong', () async {
    failureMock();

    final result = await usecase(params);

    expect(result, Left(ServerFailure()));
  });
}
