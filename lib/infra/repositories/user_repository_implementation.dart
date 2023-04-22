import 'package:dartz/dartz.dart';
import 'package:ratracks/core/storage/storage.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/infra/datasources/user_datasource.dart';

class UserRepositoryImplementation implements UserRepository {
  final UserDatasource datasource;
  final Storage<UserEntity> userStorage;

  UserRepositoryImplementation({
    required this.datasource,
    required this.userStorage,
  });

  @override
  Future<Either<Failure, UserEntity>> createAnonymousUser() async {
    try {
      var result = await datasource.createAnonymousUser();

      return Right(result);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setLoggedUser(UserEntity user) async {
    try {
      var result = await userStorage.write('logged_user', user);

      return Right(result);
    } catch (e) {
      return Left(StorageWriteFailure());
    }
  }
}
