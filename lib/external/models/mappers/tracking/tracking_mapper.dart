import 'package:ratracks/domain/entities/tracking_entity.dart';
import 'package:ratracks/external/models/dtos/tracking_dto.dart';
import 'package:ratracks/external/models/mappers/mapper.dart';

class TrackingMapper implements Mapper<TrackingDto, TrackingEntity> {
  @override
  TrackingEntity toEntity(TrackingDto dto) {
    return TrackingEntity(
      id: dto.id,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      status: dto.status,
      trackingCode: dto.trackingCode,
      transporter: dto.transporter,
      userId: dto.userId,
      productName: dto.productName,
    );
  }

  @override
  Map<String, dynamic> toJson(TrackingEntity entity) {
    return {
      "id": entity.id,
      "createdAt": entity.createdAt.toIso8601String(),
      "updatedAt": entity.updatedAt.toIso8601String(),
    };
  }
}