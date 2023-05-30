import 'package:equatable/equatable.dart';
import 'package:ratracks/domain/entities/enums/status_enum.dart';
import 'package:ratracks/domain/entities/enums/transporter_enum.dart';

class TrackingDetails extends Equatable {
  final DateTime expectedDate;
  final String trackCode;
  final String type;
  final Status descriptionType;
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