import 'package:equatable/equatable.dart';

class TrackingEvent extends Equatable {
  final DateTime eventDate;
  final String description;
  final String type;
  final String city;
  final String uf;

  const TrackingEvent({
    required this.eventDate,
    required this.description,
    required this.type,
    required this.city,
    required this.uf,
  });

  @override
  List<Object?> get props => [
    eventDate,
    description,
    type,
    city,
    uf,
  ];
}