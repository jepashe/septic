import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:septic/domain/store_repository.dart';
import 'package:septic/entity/user.dart';

part 'load_event.dart';
part 'load_state.dart';

class LoadingAppBloc extends Bloc<LoadingAppEvent, LoadingAppState> {
  LoadingAppBloc({required StoreRepository storeRepository})
      : _storeRepository = storeRepository,
        super(LoadingAppStartState()) {
    on<LoadingAppStartEvent>(_onLoadingAppStart);
    on<LoadingAppWhithCurrentUser>(_onLoadingAppWhithCurrentUser);
  }

  final StoreRepository _storeRepository;

  void testLoad() {
    //_storeRepository.deleteUsers();
    /*
    const String defaultUser = """{
        "user_id": 19,
        "name": "Pavel",
        "email": "subochev.pavel@gmail.com",
        "confirmed": 0
    }""";
    const String defaultUser2 = """{
        "user_id": 20,
        "name": "Egor",
        "email": "subochev.pavel@gmail.com",
        "confirmed": 0
    }""";
    final User user = User.fromJson(jsonDecode(defaultUser));
    final User user2 = User.fromJson(jsonDecode(defaultUser2));

    //_storeRepository.deleteUsers();
    _storeRepository.addUser(user);
    _storeRepository.addUser(user2);
    _storeRepository.printAllUsers();
    */
    _storeRepository.printAllUsers();
  }

  _onLoadingAppStart(
      LoadingAppStartEvent event, Emitter<LoadingAppState> emit) async {
    testLoad();
    try {
      if (_storeRepository.checkIsEmpty()) {
        emit(LoadingAppWithoutUsersState());
      } else {
        final users = _storeRepository.getAllUsers();
        if (users.length > 1) {
          List<DropdownMenuItem> userItems = [];
          for (var user in users) {
            final item = DropdownMenuItem(
              child: Text(user.name),
              value: user,
            );
            userItems.add(item);
          }
          emit(LoadingAppWithUsersState(usersItems: userItems));
        } else {
          emit(LoadingAppWhithCurrentUserState(user: users.first));
        }
      }
    } catch (e) {
      emit(LoadingAppErrorState());
    }
  }

  _onLoadingAppWhithCurrentUser(
      LoadingAppWhithCurrentUser event, Emitter<LoadingAppState> emit) {
    emit(LoadingAppWhithCurrentUserState(user: event.user));
  }

  /*
  @override
  void onEvent(LoadingAppEvent event) {
    super.onEvent(event);
    print(event);
  }
  */
}
