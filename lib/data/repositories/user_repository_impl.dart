import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/userModel.dart';
import 'package:safesuit_bank/core/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';


class UserRepositoryImpl implements UserRepository {
  final Dio _dio = Dio();

  @override
  Future<UserModel> loadFormData({required String phoneNumber, required String password}) async {
    try {
      final response = await _dio.post(
        'http://localhost:3002/api/user/',
        data: {
          'phone': phoneNumber,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception('Error en la autenticación');
      }
    } catch (e) {
      throw Exception('Error en la autenticación: $e');
    }
  }
}