import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/userRegisterModel.dart';
import 'package:safesuit_bank/core/domain/repositories/userRegister_repository.dart';
import 'package:dio/dio.dart';

class UserRegisterRepositoryImpl implements UserRegisterRepository{
  final Dio _dio = Dio();
  
  @override
  Future<void> loadFormData(UserRegisterModel user) async {
     try {
      await _dio.post('TODO: url', data: user.toJson());
    } catch (e) {
      print(e);
      throw Exception('Failed to submit Register');
    }
  }
}