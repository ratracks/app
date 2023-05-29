import 'package:equatable/equatable.dart';
import 'package:ratracks/domain/entities/enums/status_enum.dart';
import 'package:ratracks/domain/entities/enums/transporter_enum.dart';

class TrackingEntity extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  final String userId;
  final String trackingCode;
  final Status status;
  final Transporter transporter;
  final String? productName;

  const TrackingEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.trackingCode,
    required this.status,
    required this.transporter,
    this.productName,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    trackingCode,
    productName,
  ];
}