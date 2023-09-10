part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

// Для заполнения данных пользователя (Name, Email, Password)
class SignUpEnteringFieldEvent extends SignUpEvent {}

// При нажатии кнопки зарегестрировать
class SignUpNewUserEvent extends SignUpEvent {
  String email, name, password;
  SignUpNewUserEvent({
    required this.email,
    required this.name,
    required this.password,
  });
}

// Для ввода кода подтверждения Email
class SignUpEnteringConfirmCodeEmailEvent extends SignUpEvent {
  SignUpEnteringConfirmCodeEmailEvent({required this.user});
  User user;
}

// При нажатии кнопки подвердить Email

class SignUpConfirmCodePinEvent extends SignUpEvent {
  User user;
  String code;
  SignUpConfirmCodePinEvent({
    required this.code, required this.user
  });
}

// Если Email подтвержден запрос на получение токена авторизации
class SignUpGetTokenEvent extends SignUpEvent {
  String password;
  SignUpGetTokenEvent({
    required this.password,
  });
}
