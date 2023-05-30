import 'package:ratracks/domain/entities/enums/status_enum.dart';
import 'package:ratracks/domain/entities/enums/transporter_enum.dart';
import 'package:ratracks/external/models/dtos/tracking_details_dto.dart';

class TrackingDto {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userId;
  final String trackingCode;
  final String? productName;
  final Status status;
  final Transporter transporter;
  final TrackingDetailsDto? trackingDetails;

  const TrackingDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.trackingCode,
    required this.status,
    required this.transporter,
    this.trackingDetails,
    this.productName,
  });

  static TrackingDto fromJson(Map<String, dynamic> json) {
    return TrackingDto(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt'] + 'Z'),
      updatedAt: DateTime.parse(json['updatedAt'] + 'Z'),
      userId: json['userId'],
      trackingCode: json['trackingCode'],
      status: json['status'] == 'in_progress' ? Status.inProgress : Status.finished,
      transporter: Transporter.correios,
      productName: json['productName'],
      trackingDetails: json['trackingDetails'] != null ? TrackingDetailsDto.fromJson(json['trackingDetails']) : null,
    );
  }
}
