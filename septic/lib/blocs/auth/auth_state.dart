part of 'auth_bloc.dart';

abstract class AuthenticationState extends Equatable {}

class AutenticationNotState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AutenticationInProgressState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AutenticationWaitingPinState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AutenticationGetTokenState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AutenticationErrorState extends AuthenticationState {
  String error;
  AutenticationErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class AutenticationConfirmPinState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
