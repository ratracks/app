import 'package:dartz/dartz.dart';
import 'package:ratracks/domain/errors/failures.dart';

import '../entities/enums/status_enum.dart';
import '../entities/enums/transporter_enum.dart';
import '../entities/tracking_entity.dart';

abstract class TrackingRepository {
  Future<Either<Failure, void>> createTracking(CreateTrackingParams params);
  Future<Either<Failure, List<TrackingEntity>>> getTrackings(GetTrackingsParams params);
}

class CreateTrackingParams {
  String? productName;
  String trackingCode;
  Transporter transporter;
  String userId;

  CreateTrackingParams({
    this.productName,
    required this.trackingCode,
    required this.transporter,
    required this.userId,
  });
}

class GetTrackingsParams {
  Status status;
  String userId;

  GetTrackingsParams({
    required this.status,
    required this.userId,
  });
}
