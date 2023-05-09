import 'package:dartz/dartz.dart';
import 'package:ratracks/domain/errors/failures.dart';

import '../entities/enums/transporter_enum.dart';

abstract class TrackingRepository {
  Future<Either<Failure, void>> createTracking(CreateTrackingParams params);
}

class CreateTrackingParams {
  String? productName;
  String trackingCode;
  Transporter transporter;

  CreateTrackingParams({
    this.productName,
    required this.trackingCode,
    required this.transporter
  });
}
