import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagaraguakan_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PagaraguakanRepositoryImpl implements PagaraguakanRepository {
  final Dio _dio = Dio();

  @override
  Future<pagaraguakanModel> loadFormData(
      {required String NIA, required double Importe}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    final idcuenta = prefs.getString('idcuenta');
    final iduser = prefs.getString('idUser');
    final idservicio = prefs.getInt('aguakan_id');
    final cantidadenCuenta = prefs.getString('balance');
    if (cantidadenCuenta == null) {
      throw Exception("No se pudo obtener el balance de la cuenta.");
    }
    final balance = double.parse(cantidadenCuenta);
    if (Importe > balance) {
      throw Exception("El importe excede el balance disponible.");
    }
    final servicios = await _dio.get(
      'https://apimoviles-production.up.railway.app/services',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    final response = await _dio.post(
      'https://apimoviles-production.up.railway.app/log-services',
      data: {
        'id_service': idservicio,
        'id_users': iduser,
        'id_account': idcuenta,
        'amount': Importe,
        'reference': NIA
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    print(response.data);
    return pagaraguakanModel.fromJson(response.data);
  }
}
