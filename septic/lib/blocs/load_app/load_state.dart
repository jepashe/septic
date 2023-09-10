part of 'load_bloc.dart';

abstract class LoadingAppState {}

class LoadingAppStartState extends LoadingAppState {}

// Если нет сохраненого пользователя в приложении
class LoadingAppWithoutUsersState extends LoadingAppState {}

// Если есть сохраненый пользователь в приложении
class LoadingAppWithUsersState extends LoadingAppState { 
  LoadingAppWithUsersState({required this.usersItems});
  List<DropdownMenuItem> usersItems;
}

class LoadingAppWhithCurrentUserState extends LoadingAppState{
  User user;
  LoadingAppWhithCurrentUserState({required this.user});
}

class LoadingAppSuccessState extends LoadingAppState {}

class LoadingAppErrorState extends LoadingAppState {}
