import 'dart:developer';
import 'package:ratracks/domain/entities/enums/status_enum.dart';
import 'package:ratracks/external/models/dtos/tracking_event_dto.dart';

class TrackingDetailsDto {
  final DateTime expectedDate;
  final String trackCode;
  final String type;
  final Status descriptionType;
  final List<TrackingEventDto> events;

  const TrackingDetailsDto({
    required this.expectedDate,
    required this.trackCode,
    required this.type,
    required this.descriptionType,
    required this.events,
  });

  static TrackingDetailsDto fromJson(Map<String, dynamic> json) {
    log(json['events']);

    return TrackingDetailsDto(
      descriptionType: json['descriptionType'] ?? '',
      events: [],
      expectedDate: json['expectedDate'] ?? '',
      trackCode: json['trackCode'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
