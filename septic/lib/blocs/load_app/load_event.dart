part of 'load_bloc.dart';

abstract class LoadingAppEvent {}

class LoadingAppStartEvent extends LoadingAppEvent {
}

class LoadingAppWhithCurrentUser extends LoadingAppEvent {
  User user;
  LoadingAppWhithCurrentUser({required this.user});
  
}
