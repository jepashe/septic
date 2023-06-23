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

  _onSepticInit(SepticInitEvent event, Emitter<SepticState> emit) async {
    final isStoreSeptic = _storeRepository.chekStoreSepticUser();
    if (isStoreSeptic) {
      print('Есть септик');
    } else {
      emit(SepticNotState());
    }
  }

  @override
  void onEvent(SepticEvent event) {
    super.onEvent(event);
    print(event);
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
