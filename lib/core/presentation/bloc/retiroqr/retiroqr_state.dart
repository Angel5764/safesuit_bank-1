import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/retiroqrModel.dart';

class RetiroState extends Equatable {
  final String username;
  final double cantRetirar;
  final double saldoDisponible;
  final bool isValid;

  const RetiroState({
    this.username = '',
    this.cantRetirar = 0.0,
    this.saldoDisponible = 0.0,
    this.isValid = false,
  });

  RetiroState copyWith({
    String? username,
    double? cantRetirar,
    double? saldoDisponible,
    bool? isValid,
  }) {
    return RetiroState(
      username: username ?? this.username,
      cantRetirar: cantRetirar ?? this.cantRetirar,
      saldoDisponible: saldoDisponible ?? this.saldoDisponible,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [username, cantRetirar, saldoDisponible, isValid];

  factory RetiroState.fromModel(RetiroqrModel model) {
    return RetiroState(
      username: model.username,
      cantRetirar: model.cantRetirar,
      saldoDisponible: model.saldoDisponible,
      isValid: true, // Asumiendo que el modelo es válido al cargar
    );
  }
}
