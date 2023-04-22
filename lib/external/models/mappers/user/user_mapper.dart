import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/external/models/dtos/user_dto.dart';
import 'package:ratracks/external/models/mappers/mapper.dart';

class UserMapper implements Mapper<UserDto, UserEntity> {
  @override
  UserEntity toEntity(UserDto dto) {
    return UserEntity(
      id: dto.id,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      name: dto.name,
    );
  }

  @override
  Map<String, dynamic> toJson(UserEntity entity) {
    return {
      "id": entity.id,
      "createdAt": entity.createdAt.toIso8601String(),
      "updatedAt": entity.updatedAt.toIso8601String(),
      "name": entity.name,
    };
  }
}