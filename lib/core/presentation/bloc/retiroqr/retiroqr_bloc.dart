import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_retiroqr_data.dart'
    as usecase;

import 'retiroqr_event.dart';
import 'retiroqr_state.dart';

class RetiroBloc extends Bloc<RetiroEvent, RetiroState> {
  final usecase.LoadRetiroData loadRetiroData;

  RetiroBloc(this.loadRetiroData) : super(const RetiroState()) {
    on<LoadRetiroDataEvent>((event, emit) async {
      try {
        final retiroData = await loadRetiroData();
        emit(RetiroState.fromModel(retiroData));
      }catch (e){
        emit(state.copyWith(isValid: false, errorMessage: e.toString()));
      }
  });

    on<UsernameRetiro>((event, emit) {
      emit(state.copyWith(username: event.username, isValid: _validateForm(), errorMessage: ''));
    });

    on<SaldoDisponibleChanged>((event, emit) {
      emit(state.copyWith(
          saldoDisponible: event.saldoDisponible, isValid: _validateForm(), errorMessage: ''));
    });

    on<RegisterSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });

    on<CantRetirarChanged>((event, emit) {
      emit(state.copyWith(
          cantRetirar: event.cantRetirar, isValid: _validateForm(), errorMessage: ''));
    });
  }

  bool _validateForm() {
    return state.username.isNotEmpty &&
        state.cantRetirar > 0 &&
        state.saldoDisponible > 0;
  }
}
