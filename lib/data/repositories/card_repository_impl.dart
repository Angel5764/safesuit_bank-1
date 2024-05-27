import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/cardModel.dart';
import 'package:safesuit_bank/core/domain/repositories/card_repository.dart';

class CardRepositoryImpl implements CardRepository{
  @override
  Future<CardModel> loadFormData() async {
    final response = await rootBundle.loadString('assets/json_data/card.json');
    final data = json.decode(response);
    print(data);
    return CardModel.fromJson(data);
  }
}