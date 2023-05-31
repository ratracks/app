class TrackingEventDto {
  final DateTime eventDate;
  final String description;
  final String type;
  final String city;
  final String uf;

  const TrackingEventDto({
    required this.eventDate,
    required this.description,
    required this.type,
    required this.city,
    required this.uf,
  });

  static TrackingEventDto fromJson(Map<String, dynamic> json) {
    return TrackingEventDto(
      city: json['city'] ?? '',
      eventDate: json['eventDate'] != null ? DateTime.parse(json['eventDate']) : DateTime.now(),
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      uf: json['uf'] ?? '',
    );
  }
}
