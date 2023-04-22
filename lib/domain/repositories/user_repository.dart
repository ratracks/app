import 'package:dartz/dartz.dart';
import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/domain/errors/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> createAnonymousUser();
  Future<Either<Failure, void>> setLoggedUser(UserEntity user);
}