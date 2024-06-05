import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';

class PagaraguakanState extends Equatable {
  final String NIA;
  final double Importe;

  const PagaraguakanState({
    this.NIA = '',
    this.Importe = 0.0,
  });

  PagaraguakanState copyWith({
    String? NIA,
    double? Importe,
  }) {
    return PagaraguakanState(
      NIA: NIA ?? this.NIA,
      Importe: Importe ?? this.Importe,
    );
  }

  @override
  List<Object> get props => [NIA, Importe];

  factory PagaraguakanState.fromModel(pagaraguakanModel model) {
    return PagaraguakanState(
      NIA: model.NIA,
      Importe: model.Importe
    );
  }
}
