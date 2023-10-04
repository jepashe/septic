import 'package:bloc/bloc.dart';
import 'package:septic/domain/septic_repository.dart';
import 'package:septic/domain/store_repository.dart';
import 'package:equatable/equatable.dart';

part 'septic_event.dart';
part 'septic_state.dart';

class SepticBloc extends Bloc<SepticEvent, SepticState> {
  SepticBloc(
      {required SepticRepository septicRepository,
      required StoreRepository storeRepository})
      : _septicRepository = septicRepository,
        _storeRepository = storeRepository,
        super(SepticInitState()) {
    on<SepticInitEvent>(_onSepticInit);
  }

  final SepticRepository _septicRepository;
  final StoreRepository _storeRepository;

  _onSepticInit(SepticInitEvent event, Emitter<SepticState> emit) async {}

}
