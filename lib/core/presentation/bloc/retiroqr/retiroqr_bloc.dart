import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_retiroqr_data.dart'
    as usecase;
import 'retiroqr_event.dart';
import 'retiroqr_state.dart';

class RetiroBloc extends Bloc<RetiroEvent, RetiroState> {
  final usecase.LoadRetiroData loadRetiroData;

  RetiroBloc(this.loadRetiroData) : super(const RetiroState()) {
    on<LoadRetiroDataEvent>(
      (event, emit) async {
        final retiroData = await loadRetiroData();
        emit(RetiroState.fromModel(retiroData));
      },
    );

    on<CantRetirarChanged>((event, emit) {
      final newState = state.copyWith(
        cantRetirar: event.cantRetirar,
        isValid: _validateForm(event.cantRetirar, state.saldoDisponible),
      );
      emit(newState);
    });

    on<UsernameChanged>((event, emit) {
      final newState = state.copyWith(
        username: event.username,
      );
      emit(newState);
    });

    on<SaldoDisponibleChanged>((event, emit) {
      final newState = state.copyWith(
        saldoDisponible: event.saldoDisponible,
        isValid: _validateForm(state.cantRetirar, event.saldoDisponible),
      );
      emit(newState);
    });
  }

  bool _validateForm(double cantRetirar, double saldoDisponible) {
    return cantRetirar > 0 && cantRetirar <= saldoDisponible;
  }
}
