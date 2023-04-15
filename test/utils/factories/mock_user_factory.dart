import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/external/models/dtos/user_dto.dart';

class MockUser {
  static UserEntity makeEntity() {
    return UserEntity(
        id: 'Mocked UUID',
        createdAt: DateTime(2023, 10, 5),
        updatedAt: DateTime(2023, 10, 8),
        name: 'Mocked Name');
  }

  static UserDto makeDto() {
    return UserDto(
        id: 'Mocked UUID',
        createdAt: DateTime(2023, 10, 5),
        updatedAt: DateTime(2023, 10, 8),
        name: 'Mocked Name');
  }
}
