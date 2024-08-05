import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_movimientos_data.dart';
import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';
import 'package:safesuit_bank/core/presentation/bloc/movimientos/movimientos_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/movimientos/movimientos_state.dart';

class MovimientosBloc extends Bloc<MovimientosEvent, MovimientosState> {
  final LoadMovimientosData loadMovimientosData;

  MovimientosBloc(this.loadMovimientosData) : super(MovimientosState.initial()) {
    on<LoadMovimientosDataEvent>(_onLoadMovimientosData);
  }

  Future<void> _onLoadMovimientosData(
    LoadMovimientosDataEvent event,
    Emitter<MovimientosState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));

    try {
      final transactions = await loadMovimientosData.call();
      emit(state.copyWith(
        isLoading: false,
        transactions: transactions,
      ));
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load transactions: ${error.toString()}',
      ));
    }
  }
}
