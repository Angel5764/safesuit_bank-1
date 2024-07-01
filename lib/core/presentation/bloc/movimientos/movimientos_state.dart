import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/entities/movimientos.dart';
import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';

class MovimientosState extends Equatable {
  final String username;
  final double monto;
  final DateTime fecha;
  final String status;
  final String errorMessage; // Nuevo campo para mensajes de error

  MovimientosState({
    this.username = '',
    this.monto = 0.0,
    DateTime? fecha,
    this.status = '',
    this.errorMessage = '', // Inicializado como cadena vacía
  }) : fecha = fecha ?? DateTime(1970, 1, 1);

  List<TransactionEntity> get transactions => [
        TransactionEntity(
          username: username,
          monto: monto,
          fecha: fecha,
          status: status,
        )
      ];

  MovimientosState copyWith({
    String? username,
    double? monto,
    DateTime? fecha,
    String? status,
    String? errorMessage, // Agregamos el parámetro para el mensaje de error
  }) {
    return MovimientosState(
      username: username ?? this.username,
      monto: monto ?? this.monto,
      fecha: fecha ?? this.fecha,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [username, monto, fecha, status, errorMessage];

  factory MovimientosState.fromModel(MovimientosModel model) {
    return MovimientosState(
      username: model.username,
      monto: model.monto,
      fecha: model.fecha,
      status: model.status,
      errorMessage: '', // Inicializado como cadena vacía
    );
  }
}
