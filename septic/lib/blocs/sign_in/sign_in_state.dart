part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {}

// Проверка количества пользователей в хранилище

class SignInInitState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInSuccessfullState extends SignInState {
  User user;
  SignInSuccessfullState({required this.user});
  @override
  List<Object?> get props => [user];
}

class SignInRemaindPasswordState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInWaitCodeResetPasswordState extends SignInState {
  String email;
  SignInWaitCodeResetPasswordState({required this.email});
  @override
  List<Object?> get props => [email];
}

class SignInConfirmCodeState extends SignInState {
  
  @override
  List<Object?> get props => [];
}

class SignInSendNewPasswordState extends SignInState {
  @override
  List<Object?> get props => [];
}
