part of 'load_bloc.dart';

abstract class LoadingAppState {}

class LoadingAppStartState extends LoadingAppState {}

class LoadingAppWithoutUsersState extends LoadingAppState {}

class LoadingAppWithUsersState extends LoadingAppState {}

class LoadingAppSuccessState extends LoadingAppState {}

class LoadingAppErrorState extends LoadingAppState {}
