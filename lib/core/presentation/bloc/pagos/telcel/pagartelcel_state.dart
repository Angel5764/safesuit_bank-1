// pagaraguakan_state.dart
import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/pagartelcelModel.dart';

class PagartelcelState extends Equatable {
  final String NoTelcel;
  final double Importe;
  final String errorMessage;

  const PagartelcelState({
    this.NoTelcel = '',
    this.Importe = 0.0,
    this.errorMessage = '',
  });

  factory PagartelcelState.fromModel(pagartelcelModel model) {
    return PagartelcelState(
      NoTelcel: model.NoTelcel,
      Importe: model.Importe,
    );
  }

  PagartelcelState copyWith({
    String? NoTelcel,
    double? Importe,
    String? errorMessage,
  }) {
    return PagartelcelState(
      NoTelcel: NoTelcel ?? this.NoTelcel,
      Importe: Importe ?? this.Importe,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [NoTelcel, Importe, errorMessage];
}
