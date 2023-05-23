part of 'auth_bloc.dart';

abstract class AuthenticationEvent {}

class AuthenticationSignUpEvent extends AuthenticationEvent {
  String email, name;
  AuthenticationSignUpEvent({
    required this.email,
    required this.name,
  });
}

class AuthenticationWaitingConfirmPinEvent extends AuthenticationEvent {}

class AuthenticationConfirmPinEvent extends AuthenticationEvent {
  String pin;
  AuthenticationConfirmPinEvent({
    required this.pin,
  });
}

class AutenticationNotEvent extends AuthenticationEvent {}
