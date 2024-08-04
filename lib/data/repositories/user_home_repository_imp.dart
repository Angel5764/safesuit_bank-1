// /lib/data/repositories/user_home_repository_impl.dart
import 'package:safesuit_bank/core/domain/entities/user_home.dart';
import 'package:safesuit_bank/core/domain/models/user_homeModel.dart';
import 'package:safesuit_bank/core/domain/repositories/user_home_repository.dart';
import 'package:safesuit_bank/services/api_services.dart';

class UserHomeRepositoryImpl implements UserHomeRepository {
  final ApiService apiService;

  UserHomeRepositoryImpl({required this.apiService});

  @override
  Future<UserHome> getUserProfile(String token) async {
    try {
      final response = await apiService.getUserProfile(token);
      final user = UserHomeModel.fromJson(response['data']);
      return user;
    } catch (e) {
      throw Exception('Failed to load user profile');
    }
  }
}
