import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/pagartelcelModel.dart';

class PagartelcelState extends Equatable {
  final String NoTelcel;
  final double Importe;

  const PagartelcelState({
    this.NoTelcel = '',
    this.Importe = 0.0,
  });

  PagartelcelState copyWith({
    String? NoTelcel,
    double? Importe,
  }) {
    return PagartelcelState(
      NoTelcel: NoTelcel ?? this.NoTelcel,
      Importe: Importe ?? this.Importe,
    );
  }

  @override
  List<Object> get props => [NoTelcel, Importe];

  factory PagartelcelState.fromModel(pagartelcelModel model) {
    return PagartelcelState(
      NoTelcel: model.NoTelcel,
      Importe: model.Importe
    );
  }
}
