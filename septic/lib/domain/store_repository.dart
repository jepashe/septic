import 'package:hive/hive.dart';
import 'package:septic/entity/user.dart';

class StoreRepository {
  StoreRepository();

  late Box<User> _usersStore;

  Future<void> initStore() async {
    //Hive.registerAdapter(UserAdapter());
    print(Hive.isAdapterRegistered(0));
    _usersStore = await Hive.openBox<User>('usersStore');
    if (_usersStore.isOpen) {
      print('Хранилище открыто');
    }
  }

  bool checkIsEmpty() {
    print('Хранилище: ${_usersStore.isEmpty}');
    return _usersStore.isEmpty;
  }

  void addUser(User user) {
    _usersStore.put('defaultUser', user);
  }

  bool chekConfirmPinUser() {
    final user = _usersStore.get('defaultUser');
    if (user!.confirmed == 0) {
      return false;
    }
    return true;
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

  void readUser(User user) {
    _usersStore.get(user);
  }

  void printAllUsers() {
    final keys = _usersStore.keys.toList();
    for (var key in keys) {
      final user = _usersStore.get(key);
      print("$key: $user");
    }
  }
}
