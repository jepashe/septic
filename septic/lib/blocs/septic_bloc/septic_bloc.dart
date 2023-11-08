import 'package:bloc/bloc.dart';
import 'package:septic/domain/septic_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:septic/entity/user.dart';

part 'septic_event.dart';
part 'septic_state.dart';

class SepticBloc extends Bloc<SepticEvent, SepticState> {
  SepticBloc({required SepticRepository septicRepository, required User user})
      : _septicRepository = septicRepository,
        _currentUser = user,
        super(SepticInitState()) {
    on<SepticCheckUserDeviceEvent>(_onCheckUserDevice);
    on<SepticAddInfoAboutNewDeviceEvent>(
        ((event, emit) => emit(SepticAddInfoAboutNewDeviceState())));
    on<SepticSendInfoAboutNewDeviceEvent>(_onAddInfoAboutNewDevice);
    on<SepticGetDevisesDataEvent>(_onGetDevisesData);
  }

  final SepticRepository _septicRepository;
  final User _currentUser;

  _onGetDevisesData(
      SepticGetDevisesDataEvent event, Emitter<SepticState> emit) async {
    await _septicRepository.getDevicesData(
        septics: event.septics, user: _currentUser);
  }

  _onCheckUserDevice(
      SepticCheckUserDeviceEvent event, Emitter<SepticState> emit) async {
    final septics = await _septicRepository.getUserDevices(user: _currentUser);
    if (septics == null) {
      emit(SepticNotState());
    } else {
      emit(SepticListDeviceState(septics: septics));
    }
  }

  _onAddInfoAboutNewDevice(SepticSendInfoAboutNewDeviceEvent event,
      Emitter<SepticState> emit) async {
    final isSuccess = await _septicRepository.addSeptic(
        number: event.number,
        address: event.address,
        phone: event.phone,
        contact: event.contact,
        volume: event.volume,
        radius: event.radius,
        height: event.height,
        shift: event.shift,
        threshold: event.threshold,
        user: _currentUser);
    if (isSuccess) {
      emit(SepticAddNewDeviceSucsessState());
    }
  }
}
