import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ratracks/core/storage/storage.dart';

class StorageImplementation<TValue> implements Storage<TValue> {
  final storage = const FlutterSecureStorage();
  
  @override
  Future<TValue?> read(String key) async {
    var result = await storage.read(key: key);

    if (result == null) {
      return null;
    }

    return json.decode(result);
  }

  @override
  Future<void> write(String key, value) async {
    await storage.write(key: key, value: json.encode(value));
  }
}