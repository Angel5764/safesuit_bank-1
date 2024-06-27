import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';

class MovimientosState
    extends Equatable {
  final String
      username;
  final double
      monto;
  final DateTime
      fecha;
  final DateTime
      hora;

  MovimientosState({
    this.username =
        '',
    this.monto =
        0.0,
    DateTime?
        fecha,
    DateTime?
        hora,
  })  : fecha = fecha ?? DateTime(1970, 1, 1),
        hora = hora ?? DateTime(1970, 1, 1, 0, 0, 0);

  MovimientosState
      copyWith({
    String?
        username,
    double?
        monto,
    DateTime?
        fecha,
    DateTime?
        hora,
  }) {
    return MovimientosState(
      username: username ?? this.username,
      monto: monto ?? this.monto,
      fecha: fecha ?? this.fecha,
      hora: hora ?? this.hora,
    );
  }

  @override
  List<Object> get props =>
      [
        username,
        monto,
        fecha,
        hora
      ];

  factory MovimientosState.fromModel(
      MovimientosModel model) {
    return MovimientosState(
        username: model.username,
        monto: model.monto,
        fecha: model.fecha,
        hora: model.hora);
  }
}
