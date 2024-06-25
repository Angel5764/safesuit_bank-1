import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_movimientos_data.dart' as usecase;
import 'movimientos_event.dart';
import 'movimientos_state.dart';

class MovimientosBloc extends Bloc<MovimientosEvent, MovimientosState> {
  final usecase.LoadMovimientosData loadMovimientosData;

  MovimientosBloc(this.loadMovimientosData) : super(MovimientosState()) {
    on<LoadMovimientosDataEvent>((event, emit) async {
      final movimientosData = await loadMovimientosData();
      emit(MovimientosState.fromModel(movimientosData));
    });

    on<CantMovimientosChanged>((event, emit) {
      emit(state.copyWith(
        username: event.username,
        monto: event.monto,
        fecha: event.fecha,
        hora: event.hora,
      ));
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

    on<MovimientosHoraChanged>((event, emit) {
      emit(state.copyWith(
        hora: event.hora,
      ));
    });
  }
}
