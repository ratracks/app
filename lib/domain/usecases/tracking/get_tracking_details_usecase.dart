import 'package:dartz/dartz.dart';
import 'package:ratracks/domain/entities/tracking_entity.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/domain/usecases/usecase.dart';

class GetTrackingDetailsUseCase extends UseCase<GetTrackingDetailsParams, TrackingEntity> {
  final TrackingRepository repository;

  GetTrackingDetailsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, TrackingEntity>> call(GetTrackingDetailsParams params) async {
    return await repository.getTrackingDetails(params);
  }
}