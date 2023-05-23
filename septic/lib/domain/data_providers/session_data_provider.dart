//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
/*
class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  static const ids = 'session_ids';
  static const _keyFirstLevel = 'first_level';
  static const _keySecondLevel = 'second_level';

  static Future setFirstLevel(String firstlevel) async =>
      await _secureStorage.write(key: _keyFirstLevel, value: firstlevel);

  static Future<String?> getFirstLevel() async =>
      await _secureStorage.read(key: _keyFirstLevel);

  static Future setSecondLevel(String secondlevel) async =>
      await _secureStorage.write(key: _keySecondLevel, value: secondlevel);

  static Future<String?> getSecondLevel() async =>
      await _secureStorage.read(key: _keySecondLevel);

  Future<String?> getIds() => _secureStorage.read(key: ids);

  Future<void> setIds(String? value) {
    if (value != null) {
      return _secureStorage.write(key: ids, value: value);
    } else {
      return _secureStorage.delete(key: ids);
    }
  }
}
*/
/*
class DataStorage {
  Box<String>? _box;

  DataStorage() {
    _init();
  }

  Future<void> _init() async {
    await Hive.openBox<String>('testBox');
    _box = Hive.box('testBox');

    _box.
  }

  

}
*/