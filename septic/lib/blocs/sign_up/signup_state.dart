part of 'signup_bloc.dart';

abstract class SignUpState extends Equatable {}

// В процессе передаче данных и получения ответа от сервера

class SignUpInProgressState extends SignUpState {
  @override
  List<Object?> get props => [];
}

// В ожидании ввода данных от пользователя (Name, Email, Password)

class SignUpEnteringFieldState extends SignUpState {
  @override
  List<Object?> get props => [];
}

// В ожиданнии ввода кода подтверждения Email

class SignUpEnteringConfirmCodeEmailState extends SignUpState {
  @override
  List<Object?> get props => [];
}

// При удачной регистрации пользователя

class SignUpSucsessState extends SignUpState {
  @override
  List<Object?> get props => [];
}

// При ошибках в процессе регистрации

class SignUpErrorState extends SignUpState {
  final error;
  SignUpErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
