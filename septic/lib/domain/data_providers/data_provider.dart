/*
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DataProvider {
  DataProvider() {
    //Hive.initFlutter();
  }
  final _secureStorage = const FlutterSecureStorage();
  // final _box = Hive.openBox('test');

  final ids = 'session_ids';
  final _keyFirstLevel = 'first_level';
  final _keySecondLevel = 'second_level';

  Future<String?> getFirstLevel() async =>
      await _secureStorage.read(key: _keyFirstLevel);

  Future setSecondLevel(String secondlevel) async =>
      await _secureStorage.write(key: _keySecondLevel, value: secondlevel);

  Future<String?> getSecondLevel() async =>
      await _secureStorage.read(key: _keySecondLevel);

  Future<String?> getIds() {
    return _secureStorage.read(key: ids);
  }

  Future<void> setIds(String? value) {
    if (value != null) {
      return _secureStorage.write(key: ids, value: value);
    } else {
      return _secureStorage.delete(key: ids);
    }
  }
}
*/