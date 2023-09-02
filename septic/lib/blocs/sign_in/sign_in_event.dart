part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

// Для заполнения данных пользователя (Name, Email, Password)
class SignUpEnteringFieldEvent extends SignInEvent {}

// При нажатии кнопки зарегестрировать
class SignUpNewUserEvent extends SignInEvent {
  String email, name, password;
  SignUpNewUserEvent({
    required this.email,
    required this.name,
    required this.password,
  });
}

// Для ввода кода подтверждения Email
class SignUpEnteringConfirmCodeEmailEvent extends SignInEvent {}

// При нажатии кнопки подвердить Email

class SignUpConfirmCodePinEvent extends SignInEvent {
  String code;
  SignUpConfirmCodePinEvent({
    required this.code,
  });
}

// Если Email подтвержден запрос на получение токена авторизации
class SignUpGetTokenEvent extends SignInEvent {
  String password;
  SignUpGetTokenEvent({
    required this.password,
  });
}
