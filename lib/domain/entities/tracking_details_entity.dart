import 'package:equatable/equatable.dart';
import 'package:ratracks/domain/entities/tracking_event_entity.dart';

class TrackingDetails extends Equatable {
  final DateTime expectedDate;
  final String trackCode;
  final String type;
  final String descriptionType;
  final List<TrackingEvent> events;

  const TrackingDetails({
    required this.expectedDate,
    required this.trackCode,
    required this.type,
    required this.descriptionType,
    required this.events,
  });

  @override
  List<Object?> get props => [
    expectedDate,
    trackCode,
    type,
    descriptionType,
    events,
  ];
}