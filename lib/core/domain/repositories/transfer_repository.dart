import 'package:safesuit_bank/core/domain/models/transferModel.dart';

abstract class CardRepository{
  Future<TransferModel> loadFormData();
}