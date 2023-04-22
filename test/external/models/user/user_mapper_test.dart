import 'package:flutter_test/flutter_test.dart';
import 'package:ratracks/external/models/mappers/user/user_mapper.dart';

import '../../../utils/factories/mock_user_factory.dart';

void main() {
  test('should return the entity', () {
    var entity = UserMapper().toEntity(MockUser.makeDto());

    expect(entity, MockUser.makeEntity());
  });

  test('should return the correct payload', () {
    var json = UserMapper().toJson(MockUser.makeEntity());

    expect(json, MockUser.makePayload());
  });
}