import 'package:hive/hive.dart';
import 'package:septic/entity/user.dart';

class StoreRepository {
  StoreRepository({required Box<User> store}) : _usersStore = store;

  final Box<User> _usersStore;

  bool checkIsEmpty() {
    print('Хранилище: ${_usersStore.isEmpty}');
    return _usersStore.isEmpty;
  }

  Future<void> addUser(User user) async {
    await _usersStore.put('defaultUser', user);
  }

  bool checkConfirmPinUser() {
    final user = _usersStore.get('defaultUser');
    if (user!.confirmed == 0) {
      return true;
    }
    return false;
  }

  bool chekTokenUser() {
    final user = _usersStore.get('defaultUser');
    if (user!.token == null) {
      return true;
    }
    return false;
  }

  void deleteUsers() {
    final keys = _usersStore.keys;
    _usersStore.deleteAll(keys);
  }

  List<User?> getAllUsers() {
    List<User?> users = [];
    final keys = _usersStore.keys.toList();
    for (var key in keys) {
      users.add(_usersStore.get(key));
    }
    return users;
  }

  User? readUser() {
    return _usersStore.get('defaultUser');
  }

  void printAllUsers() {
    final keys = _usersStore.keys.toList();
    for (var key in keys) {
      final user = _usersStore.get(key);
      print("$key: $user");
    }
  }
}
