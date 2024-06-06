import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/transferModel.dart';
import 'package:safesuit_bank/core/domain/repositories/transfer_repository.dart';

class CardRepositoryImpl implements TransRepository{
  @override
  Future<TransferModel> loadFormData() async {
    final response = await rootBundle.loadString('assets/json_data/transfer.json');
    final data = json.decode(response);
    print(data);
    return TransferModel.fromJson(data);
  }
}