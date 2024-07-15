import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/retiroqr_model.dart';

class RetiroState extends Equatable {
  final String name;
  final String lastname;
  final double saldoDisponible;
  final bool isValid;

  const RetiroState({
    this.name = '',
    this.lastname = '',
    this.saldoDisponible = 0.0,
    this.isValid = false,
  });

  factory RetiroState.fromModel(RetiroqrModel model) {
    return RetiroState(
      name: model.name,
      lastname: model.lastname,
      saldoDisponible: model.saldoDisponible,
      isValid: true,
    );
  }

  RetiroState copyWith({
    String? name,
    String? lastname,
    double? saldoDisponible,
    bool? isValid,
  }) {
    return RetiroState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      saldoDisponible: saldoDisponible ?? this.saldoDisponible,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [name, lastname, saldoDisponible, isValid];
}
