import 'package:get_storage/get_storage.dart';

class Storage {
  const Storage._();

  static final GetStorage _storage = GetStorage();
  static GetStorage get storage => _storage;

  static Future<void> saveValue(String key, dynamic value) {
    return _storage.write(key, value);
  }

  static T? getValue<T>(String key) {
    return _storage.read<T>(key);
  }

  static bool hasData(String key) {
    return _storage.hasData(key);
  }

  static Future<void> removeValue(String key) {
    return _storage.remove(key);
  }

  static Future<void> clearStorage() {
    return _storage.erase();
  }
}
