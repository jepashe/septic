part of 'load_bloc.dart';

abstract class LoadingAppState {}

class LoadingAppStartState extends LoadingAppState {}

// Если нет сохраненого пользователя в приложении
class LoadingAppWithoutUsersState extends LoadingAppState {}

// Если есть сохраненый пользователь в приложении
class LoadingAppWithUsersState extends LoadingAppState {
  final User user;

  LoadingAppWithUsersState({required this.user});
}

class LoadingAppSuccessState extends LoadingAppState {}

class LoadingAppErrorState extends LoadingAppState {}
