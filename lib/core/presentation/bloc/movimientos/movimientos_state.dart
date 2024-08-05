import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';

class MovimientosState {
  final bool isLoading;
  final List<MovimientosModel> transactions;
  final String errorMessage;

  MovimientosState({
    required this.isLoading,
    required this.transactions,
    required this.errorMessage,
  });

  factory MovimientosState.initial() {
    return MovimientosState(
      isLoading: false,
      transactions: [],
      errorMessage: '',
    );
  }

  MovimientosState copyWith({
    bool? isLoading,
    List<MovimientosModel>? transactions,
    String? errorMessage,
  }) {
    return MovimientosState(
      isLoading: isLoading ?? this.isLoading,
      transactions: transactions ?? this.transactions,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
