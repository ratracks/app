import 'dart:convert';

import 'package:ratracks/core/http/http_client.dart';
import 'package:ratracks/domain/entities/user_entity.dart';
import 'package:ratracks/domain/errors/exceptions.dart';
import 'package:ratracks/external/datasources/endpoints.dart';
import 'package:ratracks/external/models/dtos/user_dto.dart';
import 'package:ratracks/external/models/mappers/user/user_mapper.dart';
import 'package:ratracks/infra/datasources/user_datasource.dart';

class HttpUserDatasource implements UserDatasource {
  final HttpClient httpClient;

  HttpUserDatasource({
    required this.httpClient,
  });

  @override
  Future<UserEntity> createAnonymousUser() async {
    final url = Endpoints.anonymousUser();
    final response = await httpClient.post(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.data);
      
      UserDto dto = UserDto.fromJson(json);

      return UserMapper().toEntity(dto);
    } else {
      throw ServerException();
    }
  }
}