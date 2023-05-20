import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ratracks/core/storage/storage.dart';
import 'package:ratracks/domain/errors/exceptions.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/external/models/dtos/user_dto.dart';
import 'package:ratracks/external/models/mappers/user/user_mapper.dart';
import 'package:ratracks/infra/datasources/user_datasource.dart';

class UserRepositoryImplementation implements UserRepository {
  final UserDatasource datasource;
  final Storage userStorage;

  UserRepositoryImplementation({
    required this.datasource,
    required this.userStorage,
  });

  @override
  Future<Either<Failure, UserEntity>> createAnonymousUser() async {
    try {
      var result = await datasource.createAnonymousUser();

      return Right(result);
    } on ServerException catch(error) {
      return Left(ServerFailure(message: error.message ?? 'Ocorreu um erro inesperado ao iniciar.'));
    }catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setLoggedUser(UserEntity user) async {
    try {
      var result = await userStorage.write('logged_user', json.encode(UserMapper().toJson(user)));

      return Right(result);
    } catch (e) {
      return Left(StorageWriteFailure());
    }
  }
  
  @override
  Future<Either<Failure, UserEntity?>> getLoggedUser() async {
    try {
      var result = await userStorage.read('logged_user');

      if (result == null) {
        return const Right(null);
      }

      return Right(UserMapper().toEntity(UserDto.fromJson(json.decode(result))));
    } catch (e) {
      return Left(StorageReadFailure());
    }
  }
}
