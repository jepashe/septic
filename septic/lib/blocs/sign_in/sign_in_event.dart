part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInWhithUsers extends SignInEvent {
  final String usersName;

  SignInWhithUsers({required this.usersName});
}
