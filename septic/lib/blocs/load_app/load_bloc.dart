import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:septic/domain/store_repository.dart';
import 'package:septic/entity/user.dart';

part 'load_event.dart';
part 'load_state.dart';

class LoadingAppBloc extends Bloc<LoadingAppEvent, LoadingAppState> {
  LoadingAppBloc({required StoreRepository storeRepository})
      : _storeRepository = storeRepository,
        super(LoadingAppStartState()) {
    on<LoadingAppStartEvent>(_onLoadingAppStart);
  }

  final StoreRepository _storeRepository;

  _onLoadingAppStart(
      LoadingAppStartEvent event, Emitter<LoadingAppState> emit) async {
    try {
      /*
      const String defaultUser = """{
        "user_id": 19,
        "name": "Pavel",
        "email": "subochev.pavel@gmail.com",
        "confirmed": 0
    }""";
      final User user = User.fromJson(jsonDecode(defaultUser));*/
      _storeRepository.deleteUsers();
      //_storeRepository.addUser(user);
      //_storeRepository.printAllUsers();

      if (_storeRepository.checkIsEmpty()) {
        emit(LoadingAppWithoutUsersState());
      }
      /*
      if (_storeRepository.checkConfirmPinUser()) {
        final user = _storeRepository.readUser();
        if (user != null) {
          emit(LoadingAppWithUsersState(user: user));
        }
      }

      emit(LoadingAppSuccessState());*/
    } catch (e) {
      emit(LoadingAppErrorState());
    }
  }

  @override
  void onEvent(LoadingAppEvent event) {
    super.onEvent(event);
    print(event);
  }
}
