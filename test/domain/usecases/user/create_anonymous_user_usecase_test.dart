import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/domain/usecases/usecase.dart';
import 'package:ratracks/domain/usecases/user/create_anonymous_user_usecase.dart';

import '../../../utils/factories/mock_user_factory.dart';

class MockedUserRepository extends Mock implements UserRepository {}

void main() {
  late CreateAnonymousUserUsecase usecase;
  late UserRepository repository;

  setUp(() {
    repository = MockedUserRepository();
    usecase = CreateAnonymousUserUsecase(repository: repository);
  });

  void successMock() {
    when(() => repository.createAnonymousUser())
      .thenAnswer((_) async => Right(MockUser.makeEntity()));
  }

  void failureMock() {
    when(() => repository.createAnonymousUser())
      .thenAnswer((_) async => Left(ServerFailure()));
  }

  test('should call the repository', () async {
    successMock();

    await usecase(NoParams());

    verify(() => repository.createAnonymousUser()).called(1);
  });

  test('should return an user when calling the respository sucessfully', () async {
    successMock();

    final result = await usecase(NoParams());

    expect(result, Right(MockUser.makeEntity()));
  });

  test('should return a failure when something went wrong', () async {
    failureMock();

    final result = await usecase(NoParams());

    expect(result, Left(ServerFailure()));
  });
}