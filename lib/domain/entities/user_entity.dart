import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  final String name;

  const UserEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  @override
  List<Object?> get props => [
    id,
    createdAt,
    updatedAt,
    name,
  ];
}