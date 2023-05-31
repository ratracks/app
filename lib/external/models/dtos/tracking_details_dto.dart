import 'package:ratracks/external/models/dtos/tracking_event_dto.dart';

class TrackingDetailsDto {
  final DateTime expectedDate;
  final String trackCode;
  final String type;
  final String descriptionType;
  final List<TrackingEventDto> events;

  const TrackingDetailsDto({
    required this.expectedDate,
    required this.trackCode,
    required this.type,
    required this.descriptionType,
    required this.events,
  });

  static TrackingDetailsDto fromJson(Map<String, dynamic> json) {
    List<TrackingEventDto> eventDtos = !json['events'].isEmpty ? List<TrackingEventDto>.from(json['events'].map((i) => TrackingEventDto.fromJson(i))) : [];

    return TrackingDetailsDto(
      descriptionType: json['descriptionType'] ?? '',
      events: eventDtos,
      expectedDate: json['expectedDate'] != null ? DateTime.parse(json['expectedDate']) : DateTime.now(),
      trackCode: json['trackCode'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
