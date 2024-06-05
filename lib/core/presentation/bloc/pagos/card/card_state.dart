import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/cardModel.dart';

class CardState extends Equatable {
  final String number;
  final String expireDate;
  final String owner;
  final String bankName;
  final int ccv;

  const CardState({
    this.number = '',
    this.expireDate = "",
    this.owner = "",
    this.bankName = "",
    this.ccv = 125,
  });

  CardState copyWith({
    String? number,
    String? expireDate,
    String? owner,
    String? bankName,
    int? ccv, required amounUser, required amounCard,
  }) {
    return CardState(
      number: number ?? this.number,
      expireDate: expireDate ?? this.expireDate,
      owner: owner ?? this.owner,
      bankName: bankName ?? this.bankName,
      ccv: ccv ?? this.ccv,
    );
  }

  @override
  List<Object> get props => [number, expireDate, owner, bankName, ccv];

  factory CardState.fromModel(CardModel model) {
    return CardState(
      number: model.number,
      expireDate: model.expireDate,
      owner: model.owner,
      bankName: model.bankName,
      ccv: model.ccv
    );
  }
}
