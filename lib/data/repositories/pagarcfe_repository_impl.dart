import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/pagarcfeModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagarcfe_repository.dart';

class PagarcfeRepositoryImpl implements PagarcfeRepository{
  @override
  Future<pagarcfeModel> loadFormData() async {
    final response = await rootBundle.loadString('json_data/pagarcfe.json');
    final data = json.decode(response);
    print(data);
    return pagarcfeModel.fromJson(data);
  }
}