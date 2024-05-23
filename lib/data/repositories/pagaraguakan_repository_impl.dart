import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagaraguakan_repository.dart';

class PagaraguakanRepositoryImpl implements PagaraguakanRepository{
  @override
  Future<pagaraguakanModel> loadFormData() async {
    final response = await rootBundle.loadString('assets/json_data/pagaraguakan.json');
    final data = json.decode(response);
    print(data);
    return pagaraguakanModel.fromJson(data);
  }
}