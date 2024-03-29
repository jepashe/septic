import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:septic/domain/auth_repository.dart';
import 'package:septic/domain/store_repository.dart';
import 'package:septic/entity/user.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

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
    on<SignUpEnteringConfirmCodeEmailEvent>((event, emit) {
      emit(SignUpEnteringConfirmCodeEmailState(user: event.user));
    });
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

    if (event.email.isEmpty || event.name.isEmpty || event.password.isEmpty) {
      emit(SignUpErrorState(error: 'Заполните форму входа'));
      emit(SignUpEnteringFieldState());
    } else if (emailValid(email: event.email)) {
      emit(SignUpInProgressState());
      try {
        User user = await _authenticationRepository.signUp(
            email: event.email, name: event.name);
        user = user.copyWith(password: event.password);
        _storeRepository.addUser(user);
        emit(SignUpEnteringConfirmCodeEmailState(user: user));
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
      emit(SignUpEnteringConfirmCodeEmailState(user: event.user));
    } else {
      emit(SignUpInProgressState());

      try {
        final isConfirm = await _authenticationRepository.confirmEmail(
            code: event.code, id: event.user.user_id, email: event.user.email);
        if (isConfirm) {
          final email = event.user.email;
          final password = event.user.password;
          if (password != null) {
            final token = await _authenticationRepository.getToken(
                email: email, password: password);
            final new_user =
                event.user.copyWith(confirmed: 1, token: token['token']);
            _storeRepository.addUser(new_user);
            emit(SignUpSucsessState());
          }
        }
      } catch (e) {
        emit(SignUpErrorState(error: 'Ошибка, попробуйте снова'));
      }
    }
  }

  /*
  @override
  void onEvent(SignUpEvent event) {
    super.onEvent(event);
    print(event);
  }*/
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