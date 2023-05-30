import 'package:dartz/dartz.dart';
import 'package:ratracks/domain/entities/tracking_entity.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/domain/usecases/usecase.dart';

class GetTrackingsUsecase extends UseCase<GetTrackingsParams, List<TrackingEntity>> {
  final TrackingRepository repository;

  GetTrackingsUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<TrackingEntity>>> call(GetTrackingsParams params) async {
    return await repository.getTrackings(params);
  }
}