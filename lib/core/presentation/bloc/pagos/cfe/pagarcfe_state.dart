import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/pagarcfeModel.dart';

class PagarcfeState extends Equatable {
  final String Numservices;
  final double Importe;

  const PagarcfeState({
    this.Numservices = '',
    this.Importe = 0.0,
  });

  PagarcfeState copyWith({
    String? Numservices,
    double? Importe,
  }) {
    return PagarcfeState(
      Numservices: Numservices ?? this.Numservices,
      Importe: Importe ?? this.Importe,
    );
  }

  @override
  List<Object> get props => [Numservices, Importe];

  factory PagarcfeState.fromModel(pagarcfeModel model) {
    return PagarcfeState(
      Numservices: model.Numservices,
      Importe: model.Importe
    );
  }
}
