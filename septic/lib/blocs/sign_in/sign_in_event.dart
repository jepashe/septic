part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInWhithEmailEvent extends SignInEvent {
  SignInWhithEmailEvent({required this.email, required this.password});
  String email;
  String password;
}

class SignInRemaindPasswordEvent extends SignInEvent {}

class SignInSendForgetPasswordOnEmailEvent extends SignInEvent {
  String email;
  SignInSendForgetPasswordOnEmailEvent({required this.email});
}
