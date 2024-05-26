import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_retiroqr_data.dart' as usecase;
import 'retiroqr_event.dart';
import 'retiroqr_state.dart';

class RetiroBloc extends Bloc<RetiroEvent, RetiroState> {
  final usecase.LoadRetiroData loadRetiroData;

  RetiroBloc(this.loadRetiroData) : super(const RetiroState()) {
    on<LoadRetiroDataEvent>((event, emit) async {
      final retiroData = await loadRetiroData();
      emit(RetiroState.fromModel(retiroData));
    });

    on<CantRetirarChanged>((event, emit) {
      emit(state.copyWith(
        cantRetirar: event.cantRetirar,
        isValid: _validateForm(event.cantRetirar, state.saldoDisponible),
      ));
    });
  }

  bool _validateForm(double cantRetirar, double saldoDisponible) {
    return cantRetirar > 0 && cantRetirar <= saldoDisponible;
  }
}
