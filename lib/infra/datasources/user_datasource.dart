import 'package:ratracks/domain/entities/user_entity.dart';

abstract class UserDatasource {
  Future<UserEntity> createAnonymousUser();
}