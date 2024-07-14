import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/userModel.dart';
import 'package:safesuit_bank/core/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio _dio = Dio();

  @override
  Future<UserModel> loadFormData({required String phoneNumber, required String password}) async {

      final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/auth/login',
        data: {
          "phone": phoneNumber,
          "password": password,
        },
      );

      print(response);

      if (response.statusCode == 200) {
        // Parse the response data to get the token
        final data = response.data;
        final token = data['access_token']; // Asegúrate de que la clave 'token' sea correcta

        // Save the token in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        return UserModel.fromJson(data);
      } else {
        throw Exception('Error en la autenticación');
      }
  }
}