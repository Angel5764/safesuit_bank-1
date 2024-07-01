import 'package:equatable/equatable.dart';

abstract class MovimientosEvent extends Equatable {
  const MovimientosEvent();

  @override
  List<Object> get props => [];
}

class LoadMovimientosDataEvent extends MovimientosEvent {}

class MovimientosUsernameChanged extends MovimientosEvent {
  final String username;

  const MovimientosUsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

class MovimientosMontoChanged extends MovimientosEvent {
  final double monto;

  const MovimientosMontoChanged(this.monto);

  @override
  List<Object> get props => [monto];
}

class MovimientosFechaChanged extends MovimientosEvent {
  final DateTime fecha;

  const MovimientosFechaChanged(this.fecha);

  @override
  List<Object> get props => [fecha];
}

class MovimientosStatusChanged extends MovimientosEvent {
  final String status;

  const MovimientosStatusChanged(this.status);

  @override
  List<Object> get props => [status];
}
