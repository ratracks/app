import 'package:dartz/dartz.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/domain/usecases/usecase.dart';

class SetLoggedUserUsecase extends UseCase<UserEntity, void> {
  final UserRepository repository;

  SetLoggedUserUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(UserEntity user) async {
    return await repository.setLoggedUser(user);
  }
}