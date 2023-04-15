import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ratracks/domain/errors/exceptions.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/infra/datasources/user_datasource.dart';
import 'package:ratracks/infra/repositories/user_repository_implementation.dart';

import '../../utils/factories/mock_user_factory.dart';

class MockedUserDatasource extends Mock implements UserDatasource {}

void main() {
  late UserRepository repository;
  late UserDatasource datasource;

  setUp(() {
    datasource = MockedUserDatasource();
    repository = UserRepositoryImplementation(datasource: datasource);
  });

  test('should call the datasource', () async {
    when(() => datasource.createAnonymousUser())
        .thenAnswer((_) async => MockUser.makeEntity());

    await repository.createAnonymousUser();

    verify(() => datasource.createAnonymousUser()).called(1);
  });

  test('should return an user', () async {
    when(() => datasource.createAnonymousUser())
        .thenAnswer((_) async => MockUser.makeEntity());

    final result = await repository.createAnonymousUser();

    expect(result, Right(MockUser.makeEntity()));
  });

  test('should throw an ServerFailure when datasource throws a server exception', () async {
    when(() => datasource.createAnonymousUser()).thenThrow(ServerException());

    final result = await repository.createAnonymousUser();

    expect(result, Left(ServerFailure()));
  });
}
