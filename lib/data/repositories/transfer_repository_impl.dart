import 'package:safesuit_bank/core/domain/models/transferModel.dart';
import 'package:safesuit_bank/core/domain/repositories/transfer_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransferRepositoryImpl implements TransRepository {
  final Dio _dio = Dio();

  @override
  Future<List<TransferModel>> loadFormData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final response = await _dio.get(
        'https://apimoviles-production.up.railway.app/contacts',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        // Verificar que la estructura del JSON es correcta
        if (data['status'] == 'Success' && data['data'] != null) {
          List<dynamic> dataList = data['data'];
          List<TransferModel> transfers = dataList
              .map((transferJson) => TransferModel.fromJson(transferJson))
              .toList();
          return transfers;
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Error fetching contacts');
      }
    } catch (e) {
      throw Exception('Error fetching contacts: $e');
    }
  }
}
