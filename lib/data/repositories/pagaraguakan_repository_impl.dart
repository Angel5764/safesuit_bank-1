import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagaraguakan_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PagaraguakanRepositoryImpl implements PagaraguakanRepository{
    final Dio _dio = Dio();

  @override
  Future<pagaraguakanModel> loadFormData({required String NIA,   required double Importe}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');  
     final cuentaresponse = await _dio.get(
        'https://apimoviles-production.up.railway.app/accounts/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    print(cuentaresponse.data);
    final data = cuentaresponse.data;
    final int id = data['id'];
    final int idUser = data['id_user'];
     
    final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/log-services',
        data: {
          'id_service': "11",
          'id_users': idUser,
          'id_account': id,
          'amount': Importe,
          'reference': NIA
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response);
    
    return pagaraguakanModel.fromJson(response.data);
  }
}