// import 'package:safesuit_bank/core/domain/entities/card.dart';

class CardModel{
  final String number;
  final int ccv;
  final String expireDate;
  final String owner;
  final String bankName;

  CardModel ({required this.number,
    required this.ccv,
    required this.expireDate,
    required this.owner,
    required this.bankName,
  });

}
