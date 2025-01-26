import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doa_event.dart';
part 'doa_state.dart';

class DoaBloc extends Bloc<DoaEvent, DoaState> {
  DoaBloc() : super(DoaState()) {
    on<OnInit>(_onInit);
  }

  void _onInit(OnInit event, Emitter<DoaState> emit) {
    try {
      emit(DoaLoading());
      
    } catch (e) {
      emit(DoaSuccess());
    }
  }
}
