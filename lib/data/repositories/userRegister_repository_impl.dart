import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:safesuit_bank/core/domain/models/userRegisterModel.dart';
import 'package:safesuit_bank/core/domain/repositories/userRegister_repository.dart';

class UserRegisterRepositoryImpl implements UserRegisterRepository {
  final Dio _dio = Dio();
  
  @override
  Future<void> loadFormData(UserRegisterModel user) async {
    try {
      final jsonData = user.toJson();
      jsonData['id_bank'] = '5';
      final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/',
        data: jsonData,
      );
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to submit Register');
    }
  }
}

