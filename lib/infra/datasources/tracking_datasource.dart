import 'package:ratracks/domain/entities/tracking_entity.dart';

import '../../domain/repositories/tracking_repository.dart';

abstract class TrackingDatasource {
  Future<void> create(CreateTrackingParams params);
  Future<List<TrackingEntity>> getTrackings(GetTrackingsParams params);
  Future<TrackingEntity> getTrackingDetails(GetTrackingDetailsParams params);
}