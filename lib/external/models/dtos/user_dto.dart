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
}