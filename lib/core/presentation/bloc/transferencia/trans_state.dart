import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/transferModel.dart';

class TransState extends Equatable {
  final String numbercardtransfer;
  final String ownertransfer;
  final String bankNametransfer;
  final double amountransfer;

  const TransState({
    this.numbercardtransfer = '',
    this.ownertransfer = "",
    this.bankNametransfer = "",
    this.amountransfer = 5000,
  });

  TransState copyWith({
    String? numbercardtransfer,
    String? ownertransfer,
    String? bankNametransfer,
    double? amountransfer,
  }) {
    return TransState(
      numbercardtransfer: numbercardtransfer ?? this.numbercardtransfer,
      ownertransfer: ownertransfer ?? this.ownertransfer,
      bankNametransfer: bankNametransfer ?? this.bankNametransfer,
      amountransfer: amountransfer ?? this.amountransfer,
    );
  }

  @override
  List<Object> get props => [numbercardtransfer, ownertransfer, bankNametransfer, amountransfer];

  factory TransState.fromModel(TransferModel model) {
    return TransState(
      numbercardtransfer: model.numbercardtransfer,
      ownertransfer: model.ownertransfer,
      bankNametransfer: model.bankNametransfer,
      amountransfer: model.amountransfer
    );
  }
}
