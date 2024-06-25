import 'package:equatable/equatable.dart';

abstract class MovimientosEvent extends Equatable {
  const MovimientosEvent();

  @override
  List<Object> get props => [];
}

class LoadMovimientosDataEvent extends MovimientosEvent {}

class CantMovimientosChanged extends MovimientosEvent {
  final String username;
  final double monto;
  final DateTime fecha;
  final DateTime hora;

  const CantMovimientosChanged(this.username, this.monto, this.fecha, this.hora);

  @override
  List<Object> get props => [username, monto, fecha, hora];
}

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

class MovimientosHoraChanged extends MovimientosEvent {
  final DateTime hora;

  const MovimientosHoraChanged(this.hora);

  @override
  List<Object> get props => [hora];
}
