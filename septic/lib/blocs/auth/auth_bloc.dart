import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:septic/domain/auth_repository.dart';
import 'package:septic/domain/store_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository,
      required StoreRepository storeRepository})
      : _authenticationRepository = authenticationRepository,
        _storeRepository = storeRepository,
        super(AutenticationNotState()) {
    on<AuthenticationSignUpEvent>(_onAuthenticationSignUp);
    on<AuthenticationConfirmPinEvent>(_onAuthenticationConfirmPin);
    on<AuthenticationWaitingConfirmPinEvent>(
        (event, emit) => emit(AutenticationWaitingPinState()));
    on<AutenticationNotEvent>((event, emit) => emit(AutenticationNotState()));
  }

  final AuthenticationRepository _authenticationRepository;
  final StoreRepository _storeRepository;

  _onAuthenticationSignUp(AuthenticationSignUpEvent event,
      Emitter<AuthenticationState> emit) async {
    //Валидация email
    bool emailValid({required String email}) {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
          .hasMatch(email);
      return emailValid;
    }

    if (event.email.isEmpty || event.name.isEmpty) {
      emit(AutenticationErrorState(error: 'Заполните форму входа'));
      emit(AutenticationNotState());
    } else if (emailValid(email: event.email)) {
      emit(AutenticationInProgressState());
      try {
        final user = await _authenticationRepository.signUp(
            email: event.email, name: event.name);
      } catch (e) {
        emit(AutenticationErrorState(error: 'Ошибка, бля'));
      }
    } else {
      emit(AutenticationErrorState(error: 'Заполните email правильно'));
      emit(AutenticationNotState());
    }
  }

  _onAuthenticationConfirmPin(AuthenticationConfirmPinEvent event,
      Emitter<AuthenticationState> emit) async {
    if (event.pin.isEmpty) {
      emit(AutenticationErrorState(error: 'Заполните код подтверждения'));
      emit(AutenticationWaitingPinState());
    } else {
      emit(AutenticationInProgressState());

      try {
        final bool isConfirm =
            await _authenticationRepository.confirmEmail(pin: event.pin);

        if (isConfirm) {
          emit(AutenticationConfirmPinState());
        } else {
          emit(AutenticationErrorState(error: 'Неверный код подтверждения'));
        }
      } catch (e) {
        emit(AutenticationErrorState(error: 'Ошибка, бля'));
      }
    }
  }

  @override
  void onEvent(AuthenticationEvent event) {
    super.onEvent(event);
    print(event);
  }
}

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
