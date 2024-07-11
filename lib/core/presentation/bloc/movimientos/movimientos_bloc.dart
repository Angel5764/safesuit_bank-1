import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_movimientos_data.dart' as usecase;
import 'movimientos_event.dart';
import 'movimientos_state.dart';

class MovimientosBloc extends Bloc<MovimientosEvent, MovimientosState> {
  final usecase.LoadMovimientosData loadMovimientosData;

  MovimientosBloc(this.loadMovimientosData) : super(MovimientosState()) {
    on<LoadMovimientosDataEvent>((event, emit) async {
      try {
        final movimientosData = await loadMovimientosData();
        emit(MovimientosState.fromModel(movimientosData));
      } catch (error) {
        emit(state.copyWith(errorMessage: error.toString()));
      }
    });

    on<MovimientosUsernameChanged>((event, emit) {
      emit(state.copyWith(
        username: event.username,
      ));
    });

    on<MovimientosMontoChanged>((event, emit) {
      emit(state.copyWith(
        monto: event.monto,
      ));
    });

    on<MovimientosFechaChanged>((event, emit) {
      emit(state.copyWith(
        fecha: event.fecha,
      ));
    });

    on<MovimientosStatusChanged>((event, emit) {
      emit(state.copyWith(
        status: event.status,
      ));
    });
  }
}
