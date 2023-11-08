part of 'septic_bloc.dart';

abstract class SepticState extends Equatable {}

class SepticInitState extends SepticState {
  @override
  List<Object?> get props => [];
}

// У пользователя нет привязанного септика
class SepticNotState extends SepticState {
  @override
  List<Object?> get props => [];
}

// Внесение информации о новом септике
class SepticAddInfoAboutNewDeviceState extends SepticState {
  @override
  List<Object?> get props => [];
}

class SepticAddNewDeviceSucsessState extends SepticState {
  @override
  List<Object?> get props => [];
}

// Список септиков привязанных к пользователю
class SepticListDeviceState extends SepticState {
  SepticListDeviceState({required this.septics});
  final List<int> septics;
  @override
  List<Object?> get props => [septics];
}
