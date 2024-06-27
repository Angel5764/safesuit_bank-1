// pagaraguakan_state.dart
import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';

class PagaraguakanState extends Equatable {
  final String NIA;
  final double Importe;
  final String errorMessage;

  const PagaraguakanState({
    this.NIA = '',
    this.Importe = 0.0,
    this.errorMessage = '',
  });

  factory PagaraguakanState.fromModel(pagaraguakanModel model) {
    return PagaraguakanState(
      NIA: model.NIA,
      Importe: model.Importe,
    );
  }

  PagaraguakanState copyWith({
    String? NIA,
    double? Importe,
    String? errorMessage,
  }) {
    return PagaraguakanState(
      NIA: NIA ?? this.NIA,
      Importe: Importe ?? this.Importe,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [NIA, Importe, errorMessage];
}
