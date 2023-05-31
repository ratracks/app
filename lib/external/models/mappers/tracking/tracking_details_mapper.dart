import 'package:ratracks/domain/entities/tracking_details_entity.dart';
import 'package:ratracks/domain/entities/tracking_event_entity.dart';
import 'package:ratracks/external/models/dtos/tracking_details_dto.dart';
import 'package:ratracks/external/models/mappers/mapper.dart';

class TrackingDetailsMapper implements Mapper<TrackingDetailsDto, TrackingDetails> {
  @override
  TrackingDetails toEntity(TrackingDetailsDto dto) {
    List<TrackingEvent> events = List<TrackingEvent>.from(dto.events.map((i) => TrackingEvent(eventDate: i.eventDate, description: i.description, type: i.type, city: i.city, uf: i.uf)));

    return TrackingDetails(
      descriptionType: dto.descriptionType,
      type: dto.type,
      expectedDate: dto.expectedDate,
      trackCode: dto.trackCode,
      events: events,
    );
  }

  @override
  Map<String, dynamic> toJson(TrackingDetails entity) {
    throw Error();
  }
}