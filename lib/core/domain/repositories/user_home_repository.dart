import 'package:safesuit_bank/core/domain/entities/user_home.dart';

abstract class UserHomeRepository {
  Future<UserHome> getUserProfile(String token);
}
