import 'package:safesuit_bank/core/domain/models/transferModel.dart';


class LoadTransData {
  Future<TransferModel> call() async{
    return TransferModel(
      numbercardtransfer: "4111 1111 1111 1111",
      ownertransfer: "John Doe Farson",
      bankNametransfer: "BandaMax",
      amountransfer: 500.0,
    );
  }
}