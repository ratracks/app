import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ratracks/core/storage/storage.dart';

class StorageImplementation implements Storage {
  final storage = const FlutterSecureStorage();
  
  @override
  Future<String?> read(String key) async {
    var result = await storage.read(key: key);

    if (result == null) {
      return null;
    }

    return result;
  }

  @override
  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}