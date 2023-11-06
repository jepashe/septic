part of 'septic_bloc.dart';

abstract class SepticEvent {}

class SepticInitEvent extends SepticEvent {}

class SepticCheckUserDeviceEvent extends SepticEvent {}

class SepticAddInfoAboutNewDeviceEvent extends SepticEvent {}

class SepticSendInfoAboutNewDeviceEvent extends SepticEvent {
  String number;
  String address;
  String phone;
  String contact;
  String volume;
  String radius;
  String height;
  String shift;
  String threshold;
  SepticSendInfoAboutNewDeviceEvent({
    required this.number,
    required this.address,
    required this.phone,
    required this.contact,
    required this.volume,
    required this.radius,
    required this.height,
    required this.shift,
    required this.threshold,
  });
}
