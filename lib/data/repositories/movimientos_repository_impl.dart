import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';
import 'package:safesuit_bank/core/domain/repositories/movimientos_repository.dart';

class MovimientosRepositoryImpl implements MovimientosRepository {
  final Dio _dio = Dio();

  @override
  Future<List<MovimientosModel>> loadFormData() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';

    final response = await _dio.get(
      'https://apimoviles-production.up.railway.app/transferences',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200 && response.data['status'] == 'Success') {
      final dataList = response.data['data'] as List;
      return dataList.map((json) => MovimientosModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movements');
    }
  } catch (e) {
    throw Exception('Error loading movements: $e');
  }
}


}
