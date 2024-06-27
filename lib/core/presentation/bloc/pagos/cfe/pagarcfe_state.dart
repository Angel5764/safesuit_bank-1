// pagaraguakan_state.dart
import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/pagarcfeModel.dart';

class PagarcfeState extends Equatable {
  final String Numservices;
  final double Importe;
  final String errorMessage;

  const PagarcfeState({
    this.Numservices = '',
    this.Importe = 0.0,
    this.errorMessage = '',
  });

  factory PagarcfeState.fromModel(pagartelcelModel model) {
    return PagarcfeState(
      Numservices: model.Numservices,
      Importe: model.Importe,
    );
  }

  PagarcfeState copyWith({
    String? Numservices,
    double? Importe,
    String? errorMessage,
  }) {
    return PagarcfeState(
      Numservices: Numservices ?? this.Numservices,
      Importe: Importe ?? this.Importe,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [Numservices, Importe, errorMessage];
}
