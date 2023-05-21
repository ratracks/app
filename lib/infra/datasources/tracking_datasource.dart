import '../../domain/repositories/tracking_repository.dart';

abstract class TrackingDatasource {
  Future<void> create(CreateTrackingParams params);
}