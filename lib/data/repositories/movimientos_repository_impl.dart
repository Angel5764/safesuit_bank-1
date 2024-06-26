import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';
import 'package:safesuit_bank/core/domain/repositories/movimientos_repository.dart';

class MovimientosRepositoryImpl implements MovimientosRepository{
  @override
  Future<MovimientosModel> loadFormData() async {
    final response = await rootBundle.loadString('assets/json_data/movimientos.json');
    final data = json.decode(response);
    print(data);
    return MovimientosModel.fromJson(data);
  }
}