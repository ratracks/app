import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/external/models/dtos/user_dto.dart';

abstract class UserDatasource {
  Future<UserEntity> createAnonymousUser();
}