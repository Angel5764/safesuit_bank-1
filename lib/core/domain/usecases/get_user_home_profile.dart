import 'package:shared_preferences/shared_preferences.dart';
import 'package:safesuit_bank/core/domain/entities/user_home.dart';
import 'package:safesuit_bank/core/domain/repositories/user_home_repository.dart';

class GetUserHomeProfile {
  final UserHomeRepository repository;

  GetUserHomeProfile({required this.repository});

  Future<UserHome> call() async {
    final token = await _getAuthToken();
    if (token == null || token.isEmpty) {
      throw Exception('Token no encontrado');
    }
    return await repository.getUserProfile(token);
  }

  Future<String?> _getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
