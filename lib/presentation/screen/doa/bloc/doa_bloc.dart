import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nur_mobile/data/repository/doa_repository.dart';

part 'doa_event.dart';
part 'doa_state.dart';

class DoaBloc extends Bloc<DoaEvent, DoaState> {
  final DoaRepository _doaRepository;
  DoaBloc({required DoaRepository doaRepository})
      : _doaRepository = doaRepository,
        super(const DoaState()) {
    on<OnInit>(_onInit);
  }

  void _onInit(OnInit event, Emitter<DoaState> emit) {
    emit(state.copyWith(status: DoaStatus.loading));
    try {} catch (e) {}
  }
}
