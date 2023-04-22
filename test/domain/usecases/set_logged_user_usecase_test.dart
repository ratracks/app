import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/domain/usecases/user/set_logged_user_usecase.dart';

import '../../utils/factories/mock_user_factory.dart';

class MockedUserRepository extends Mock implements UserRepository {}

void main() {
  late SetLoggedUserUsecase usecase;
  late UserRepository repository;

  setUp(() {
    repository = MockedUserRepository();
    usecase = SetLoggedUserUsecase(repository: repository);

    registerFallbackValue(MockUser.makeEntity());
  });

  void successMock() {
    when(() => repository.setLoggedUser(any()))
      .thenAnswer((_) async => const Right(null));
  }

  void failureMock() {
    when(() => repository.setLoggedUser(any()))
      .thenAnswer((_) async => Left(StorageWriteFailure()));
  }

  test('should call the repository', () async {
    successMock();

    await usecase(MockUser.makeEntity());

    verify(() => repository.setLoggedUser(any())).called(1);
  });

  test('should return a failure when something went wrong', () async {
    failureMock();

    final result = await usecase(MockUser.makeEntity());

    expect(result, Left(StorageWriteFailure()));
  });
}