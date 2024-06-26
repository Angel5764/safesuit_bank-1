import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/retiroqrModel.dart';
import 'package:safesuit_bank/core/domain/repositories/retiroqr_repository.dart';

class RetiroqrRepositoryImpl implements RetiroqrRepository {
  @override
  Future<RetiroqrModel> loadRetiroData() async {
    final response = await rootBundle.loadString('json_data/retiroqr.json');
    final data = json.decode(response);
    if (kDebugMode) {
      print(data);
    }
    return RetiroqrModel.fromJson(data);
  }
}
