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