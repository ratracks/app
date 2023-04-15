import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/external/models/dtos/user_dto.dart';
import 'package:ratracks/external/models/mappers/mapper.dart';

class UserMapper implements Mapper<UserDto, UserEntity> {
  @override
  UserEntity toEntity(UserDto dto) {
    // TODO: implement toEntity
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}