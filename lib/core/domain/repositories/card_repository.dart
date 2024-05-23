import 'package:safesuit_bank/core/domain/models/cardModel.dart';

abstract class CardRepository{
  Future<CardModel> loadFormData();
}