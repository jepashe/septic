import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:septic/domain/auth_repository.dart';
import 'package:septic/domain/store_repository.dart';
import 'package:septic/entity/user.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(
      {required AuthenticationRepository authenticationRepository,
      required StoreRepository storeRepository})
      : _authenticationRepository = authenticationRepository,
        _storeRepository = storeRepository,
        super(SignInInitState()) {
    on<SignInWhithEmailEvent>(_onSignInWhithUsers);
  }
  final AuthenticationRepository _authenticationRepository;
  final StoreRepository _storeRepository;

  _onSignInWhithUsers(
      SignInWhithEmailEvent event, Emitter<SignInState> emit) async {
    final token = await _authenticationRepository.getToken(
        email: event.email, password: event.password);
    if (token["success"] == true) {
      final user = await _authenticationRepository.getUserInfo(
          user_id: token['user_id'], token: token['token']);
      final userWhithToken = user.copyWith(token: token['token'], password: event.password);
      await _storeRepository.addUser(userWhithToken);
      emit(SignInSuccessfullState(user: userWhithToken));
    }

    //emit(SignInInitState());
  }
}

/*
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
*/
