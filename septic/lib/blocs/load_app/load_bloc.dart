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
      const String defaultUser = """{
        "user_id": 19,
        "name": "jhkjhkPavel1",
        "email": "subochev.pavel4@gmail.com",
        "confirmed": 0
    }""";
      final User user = User.fromJson(jsonDecode(defaultUser));
      await _storeRepository.initStore();
      _storeRepository.deleteUsers();
      _storeRepository.addUser(user);
      _storeRepository.printAllUsers();

      if (_storeRepository.checkIsEmpty()) {
        emit(LoadingAppWithoutUsersState());
      }

      if (_storeRepository.checkConfirmPinUser()) {
        emit(LoadingAppWithUsersState());
      }

      emit(LoadingAppSuccessState());
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
