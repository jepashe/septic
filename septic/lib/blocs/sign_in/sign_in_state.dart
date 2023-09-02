part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {}

// Проверка количества пользователей в хранилище

class SignInInitState extends SignInState {
  @override
  List<Object?> get props => [];
}

