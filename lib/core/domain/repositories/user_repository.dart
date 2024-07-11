import 'package:safesuit_bank/core/domain/models/userModel.dart';

abstract class UserRepository {
  Future<UserModel> loadFormData({required String phoneNumber, required String password});
}
