import 'package:flutter_test/flutter_test.dart';
import 'package:ratracks/domain/entities/user_entity.dart';

void main() {
  test('should instantiate an user', () {
    DateTime date = DateTime.now();
    UserEntity entity = UserEntity(id: 'id', createdAt: date, updatedAt: date, name: 'name');

    expect(entity.id, 'id');
    expect(entity.createdAt, date);
    expect(entity.updatedAt, date);
    expect(entity.name, 'name');
  });
}