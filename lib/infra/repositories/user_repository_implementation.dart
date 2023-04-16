import 'package:dartz/dartz.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/infra/datasources/user_datasource.dart';

class UserRepositoryImplementation implements UserRepository {
  final UserDatasource datasource;

  UserRepositoryImplementation({
    required this.datasource,
  });
  
  @override
  Future<Either<Failure, UserEntity>> createAnonymousUser() async {
    try {
      var result = await datasource.createAnonymousUser();

      return Right(result);
    } catch (error) {
      return Left(ServerFailure(message: 'Ocorreu um erro ao acessar o aplicativo. Tente novamente mais tarde.'));
    }
  }
}