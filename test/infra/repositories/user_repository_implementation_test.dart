import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ratracks/core/storage/storage.dart';
import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/domain/errors/exceptions.dart';
import 'package:ratracks/domain/repositories/user_repository.dart';
import 'package:ratracks/domain/errors/failures.dart';
import 'package:ratracks/external/models/mappers/user/user_mapper.dart';
import 'package:ratracks/infra/datasources/user_datasource.dart';
import 'package:ratracks/infra/repositories/user_repository_implementation.dart';

import '../../utils/factories/mock_user_factory.dart';

class MockedUserDatasource extends Mock implements UserDatasource {}

class MockedUserStorage extends Mock implements Storage {}

void main() {
  late UserRepository repository;
  late UserDatasource datasource;
  late Storage userStorage;

  setUp(() {
    datasource = MockedUserDatasource();
    userStorage = MockedUserStorage();
    repository = UserRepositoryImplementation(
        datasource: datasource, userStorage: userStorage);

    registerFallbackValue(MockUser.makeEntity());
  });

  group('createAnonymousUser', () {
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

    test(
        'should throw an ServerFailure when datasource throws a server exception',
        () async {
      when(() => datasource.createAnonymousUser()).thenThrow(ServerException());

      final result = await repository.createAnonymousUser();

      expect(result, Left(ServerFailure()));
    });
  });

  group('setLoggedUser', () {
    test('should write in storage', () async {
      when(() => userStorage.write(any(), any())).thenAnswer((_) async => {});

      await repository.setLoggedUser(MockUser.makeEntity());

      verify(() => userStorage.write(any(), any())).called(1);
    });

    test(
        'should throw an StorageWriteFailure if something goes wrong',
        () async {
      when(() => userStorage.write(any(), any())).thenThrow(Exception());

      final result = await repository.setLoggedUser(MockUser.makeEntity());

      expect(result, Left(StorageWriteFailure()));
    });
  });

    group('getLoggedUser', () {
    test('should read from storage', () async {
      when(() => userStorage.read(any())).thenAnswer((_) async => json.encode(UserMapper().toJson(MockUser.makeEntity())));

      await repository.getLoggedUser();

      verify(() => userStorage.read(any())).called(1);
    });

    test(
        'should throw an StorageReadFailure if something goes wrong',
        () async {
      when(() => userStorage.read(any())).thenThrow(Exception());

      final result = await repository.getLoggedUser();

      expect(result, Left(StorageReadFailure()));
    });
  });
}
