import 'package:safesuit_bank/core/domain/models/userRegisterModel.dart';

abstract class UserRegisterRepository{
  Future<UserRegisterModel> loadFormData();
}