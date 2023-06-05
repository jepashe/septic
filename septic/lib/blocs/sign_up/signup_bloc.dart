import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:septic/domain/auth_repository.dart';
import 'package:septic/domain/store_repository.dart';
import 'package:septic/entity/user.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(
      {required AuthenticationRepository authenticationRepository,
      required StoreRepository storeRepository})
      : _authenticationRepository = authenticationRepository,
        _storeRepository = storeRepository,
        super(SignUpEnteringFieldState()) {
    on<SignUpNewUserEvent>(_onSignUpNewUser);
    on<SignUpConfirmCodePinEvent>(_onSignUpConfirmCodePin);
    on<SignUpEnteringFieldEvent>(
        (event, emit) => emit(SignUpEnteringFieldState()));
    //on<AutenticationNotEvent>((event, emit) => emit(AutenticationNotState()));*/
  }

  final AuthenticationRepository _authenticationRepository;
  final StoreRepository _storeRepository;

  _onSignUpNewUser(SignUpNewUserEvent event, Emitter<SignUpState> emit) async {
    //Валидация email
    bool emailValid({required String email}) {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
          .hasMatch(email);
      return emailValid;
    }

    if (event.email.isEmpty || event.name.isEmpty) {
      emit(SignUpErrorState(error: 'Заполните форму входа'));
      emit(SignUpEnteringFieldState());
    } else if (emailValid(email: event.email)) {
      emit(SignUpInProgressState());
      try {
        final user = await _authenticationRepository.signUp(
            email: event.email, name: event.name);
        _storeRepository.addUser(user);
        emit(SignUpEnteringConfirmCodeEmailState());
      } catch (e) {
        emit(SignUpErrorState(error: 'Ошибка, попробуйте снова'));
      }
    } else {
      emit(SignUpErrorState(error: 'Заполните email правильно'));
      emit(SignUpEnteringFieldState());
    }
  }

  _onSignUpConfirmCodePin(
      SignUpConfirmCodePinEvent event, Emitter<SignUpState> emit) async {
    if (event.code.isEmpty) {
      emit(SignUpErrorState(error: 'Заполните код подтверждения'));
      emit(SignUpEnteringConfirmCodeEmailState());
    } else {
      emit(SignUpInProgressState());

      try {
        final user = _storeRepository.readUser();
        if (user != null) {
          final id = user.user_id;
          if (id != null) {
            final isConfirm = await _authenticationRepository.confirmEmail(
                code: event.code, id: id);
            if (isConfirm) {
              final email = user.email;
              final password = user.password;
              if (email != null && password != null) {
                final token = await _authenticationRepository.getToken(
                    email: email, password: password);
                final new_user = user.copyWith(confirmed: 1, token: token);
                print(new_user);
              }
            }
          }
        }
      } catch (e) {
        emit(SignUpErrorState(error: 'Ошибка, попробуйте снова'));
      }
    }
  }

  @override
  void onEvent(SignUpEvent event) {
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
