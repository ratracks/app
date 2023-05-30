import 'package:dartz/dartz.dart';
import 'package:ratracks/domain/entities/tracking_entity.dart';
import 'package:ratracks/domain/errors/exceptions.dart';
import 'package:ratracks/domain/repositories/tracking_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/infra/datasources/tracking_datasource.dart';

class TrackingRepositoryImplementation implements TrackingRepository {
  final TrackingDatasource datasource;

  TrackingRepositoryImplementation({
    required this.datasource,
  });

  @override
  Future<Either<Failure, void>> createTracking(
      CreateTrackingParams params) async {
    try {
      final result = await datasource.create(params);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TrackingEntity>>> getTrackings(GetTrackingsParams params) async {
    try {
      final result = await datasource.getTrackings(params);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, TrackingEntity>> getTrackingDetails(GetTrackingDetailsParams params) async {
    try {
      final result = await datasource.getTrackingDetails(params);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
