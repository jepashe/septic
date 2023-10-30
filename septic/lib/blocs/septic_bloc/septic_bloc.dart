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
    on<SepticInitEvent>(_onSepticInit);
  }

  final SepticRepository _septicRepository;
  final User _currentUser;

  _onSepticInit(SepticInitEvent event, Emitter<SepticState> emit) async {
    _septicRepository.getUserDevices();
  }
}
