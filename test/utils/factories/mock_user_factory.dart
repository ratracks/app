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

  static String makeReceivingJson() {
    return """
      {
        "id": "Mocked UUID",
        "createdAt": "2023-10-05T00:00:00.000",
        "updatedAt": "2023-10-08T00:00:00.000",
        "name": "Mocked Name"
      }
    """;
  }

  static Map<String, dynamic> makePayload() {
    return {
      "id": "Mocked UUID",
      "createdAt": "2023-10-05T00:00:00.000",
      "updatedAt": "2023-10-08T00:00:00.000",
      "name": "Mocked Name",
    };
  }
}
