class UserDto {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  final String name;

  const UserDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  static UserDto fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'], 
      createdAt: DateTime.parse(json['createdAt']), 
      updatedAt: DateTime.parse(json['updatedAt']), 
      name: json['name'],
    );
  }
}