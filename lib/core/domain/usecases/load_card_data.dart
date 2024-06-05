import 'package:safesuit_bank/core/domain/models/cardModel.dart';

class LoadCardData {
  Future<CardModel> call() async {
    return CardModel(
      number: '0000000000000000',
      ccv: 123,
      expireDate: "12/26",
      owner: "Sergio",
      bankName: "SafeSuitBank",
    );
  }
}
