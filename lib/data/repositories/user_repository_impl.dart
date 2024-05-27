import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safesuit_bank/core/domain/models/userModel.dart';
import 'package:safesuit_bank/core/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  @override
  Future<UserModel> loadFormData() async {
    final response = await rootBundle.loadString('assets/json_data/user.json');
    final data = json.decode(response);
    print(data);
    return UserModel.fromJson(data);
  }
}