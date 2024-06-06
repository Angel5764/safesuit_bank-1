import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/userRegisterModel.dart';
import 'package:safesuit_bank/core/domain/repositories/userRegister_repository.dart';

class UserRegisterRepositoryImpl implements UserRegisterRepository{
  @override
  Future<UserRegisterModel> loadFormData() async {
    final response = await rootBundle.loadString('assets/json_data/userRegister.json');
    final data = json.decode(response);
    print(data);
    return UserRegisterModel.fromJson(data);
  }
}