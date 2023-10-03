import 'package:hive/hive.dart';
import 'package:septic/entity/user.dart';

class StoreRepository {
  StoreRepository({required Box<User> store}) : _usersStore = store;

  final Box<User> _usersStore;
  
  // Возвращает true если хранилище пустое
  bool checkIsEmpty() {
    //print('Хранилище: ${_usersStore.isEmpty}');
    //final store = _usersStore.isEmpty;
    return _usersStore.isEmpty;
  }
  // Добовляет User в хранилище по ключу user_id
  Future<void> addUser(User user) async {
    await _usersStore.put(user.user_id, user);
  }
  // Возвращает true если у польователя не пожтвержден email
  bool checkIsConfirmPinUser({required User user}) {
    final userConfirm = _usersStore.get(user.user_id);
    if (userConfirm!.confirmed == 0) {
      return true;
    }
    return false;
  }
  // Возвращает true если у польователя нет токена
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

  List<User> getAllUsers() {
    List<User> users = [];
    final keys = _usersStore.keys.toList();
    for (var key in keys) {
      final user = _usersStore.get(key);
      if (user != null) {
        users.add(user);
      }
    }
    return users;
  }

  User? readUser(int user_id) {
    return _usersStore.get(user_id);
  }

  User? findUser(String email) {
    final keys = _usersStore.keys.toList();
    for (var key in keys) {
      final user = _usersStore.get(key);
      if(user != null) {
        if (user.email == email) {
          return user;
        }
      }
      
    }
  }

  void printAllUsers() {
    final keys = _usersStore.keys.toList();
    for (var key in keys) {
      final user = _usersStore.get(key);
      print("$key: $user");
    }
  }
}
