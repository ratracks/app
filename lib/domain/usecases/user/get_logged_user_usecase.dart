import 'package:dartz/dartz.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/domain/usecases/usecase.dart';

class GetLoggedUserUsecase extends UseCase<NoParams, UserEntity?> {
  final UserRepository repository;

  GetLoggedUserUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) async {
    return await repository.getLoggedUser();
  }
}