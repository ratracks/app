import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/domain/usecases/usecase.dart';
import 'package:ratracks/domain/usecases/user/get_logged_user_usecase.dart';

import '../../../utils/factories/mock_user_factory.dart';

class MockedUserRepository extends Mock implements UserRepository {}

void main() {
  late GetLoggedUserUsecase usecase;
  late UserRepository repository;

  setUp(() {
    repository = MockedUserRepository();
    usecase = GetLoggedUserUsecase(repository: repository);
  });

  void successMock() {
    when(() => repository.getLoggedUser())
        .thenAnswer((_) async => Right(MockUser.makeEntity()));
  }

  void failureMock() {
    when(() => repository.getLoggedUser())
        .thenAnswer((_) async => Left(StorageReadFailure()));
  }

  test('should call the repository', () async {
    successMock();

    await usecase(NoParams());

    verify(() => repository.getLoggedUser()).called(1);
  });

    test('should call the repository', () async {
    successMock();

    await usecase(NoParams());

    verify(() => repository.getLoggedUser()).called(1);
  });

  test('should return a failure when something went wrong', () async {
    failureMock();

    final result = await usecase(NoParams());

    expect(result, Left(StorageReadFailure()));
  });
}
