import 'package:equatable/equatable.dart';
import 'package:ratracks/domain/entities/enums/status_enum.dart';
import 'package:ratracks/domain/entities/enums/transporter_enum.dart';
import 'package:ratracks/domain/entities/tracking_details_entity.dart';

class TrackingEntity extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  final String userId;
  final String trackingCode;
  final Status status;
  final Transporter transporter;
  final String? productName;
  final TrackingDetails? trackingDetails;

  const TrackingEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.trackingCode,
    required this.status,
    required this.transporter,
    this.productName,
    this.trackingDetails,
  });

  @override
  List<Object?> get props => [
    id,
    createdAt,
    updatedAt,
    userId,
    trackingCode,
    productName,
    status,
    transporter,
    trackingDetails,
  ];
}