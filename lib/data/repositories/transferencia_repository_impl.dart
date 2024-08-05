import 'package:safesuit_bank/core/domain/models/transferirModel.dart';
import 'package:safesuit_bank/core/domain/repositories/transferir_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MandaTransferenciaRepositoryImpl implements TransferirRepository {
  final Dio _dio = Dio();

  @override
  Future<transferirModel> loadFormData({
    required int receptor_account,
    required int amount,
    required String concept,
    required String owner,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final sender_account = prefs.getString('card_account');

      final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/transferences',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'id': 0,
          'sender_account': sender_account,
          'receptor_account': receptor_account,
          'amount': amount,
          'concept': concept,
          'owner': owner,
        },
      );

      if (response.statusCode == 201) {
        final data = response.data;

        if (data['status'] == 'Success' && data['data'] != null) {
          return transferirModel.fromJson(data['data']);
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Error adding transfer');
      }
    } catch (e) {
      throw Exception('Error adding transfer: $e');
    }
  }
}
