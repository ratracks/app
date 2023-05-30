import 'package:dartz/dartz.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/domain/usecases/usecase.dart';

class CreateTrackingUsecase extends UseCase<CreateTrackingParams, void> {
  final TrackingRepository repository;

  CreateTrackingUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(CreateTrackingParams params) async {
    return await repository.createTracking(params);
  }
}