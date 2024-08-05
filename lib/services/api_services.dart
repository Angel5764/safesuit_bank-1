import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'https://apimoviles-production.up.railway.app';
  }

  Future<Map<String, dynamic>> getUserProfile(String token) async {
    try {
      final response = await _dio.get(
        '/users',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } catch (e) {
      print(e);
      throw Exception('Failed to load user profile');
    }
  }
  Future<Map<String, dynamic>> getCardProfile(String token) async {
    try {
      final response = await _dio.get(
        '/accounts/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } catch (e) {
      print(e);
      throw Exception('Failed to load user profile');
    }
  }
  Future<void> updateUserProfile(String token, Map<String, dynamic> data) async {
    try {
      await _dio.patch(
        '/users',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      print(e);
      throw Exception('Failed to update user profile');
    }
  }
}
