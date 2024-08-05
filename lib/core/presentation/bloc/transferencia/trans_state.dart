import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/transferModel.dart';

class TransState extends Equatable {
  final List<TransferModel> transfers;

  const TransState({
    this.transfers = const [],
  });

  TransState copyWith({
    List<TransferModel>? transfers,
  }) {
    return TransState(
      transfers: transfers ?? this.transfers,
    );
  }

  @override
  List<Object> get props => [transfers];

  factory TransState.fromModel(TransferModel model) {
    return TransState(
      transfers: [model],
    );
  }

  factory TransState.empty() {
    return const TransState(transfers: []);
  }
}

class TransStateError extends TransState {
  final String message;
  const TransStateError(this.message);

  @override
  List<Object> get props => [message];
}
