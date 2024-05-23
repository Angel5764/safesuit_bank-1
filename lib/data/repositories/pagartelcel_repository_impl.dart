import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/pagartelcelModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagartelcel_repository.dart';

class pagartelcelRepositoryImpl implements PagartelcelRepository{
  @override
  Future<pagartelcelModel> loadFormData() async {
    final response = await rootBundle.loadString('assets/json_data/pagartelcel.json');
    final data = json.decode(response);
    print(data);
    return pagartelcelModel.fromJson(data);
  }
}