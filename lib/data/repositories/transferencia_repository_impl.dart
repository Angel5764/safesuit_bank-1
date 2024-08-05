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
      if (amount <= 0) {
        throw Exception('La cantidad debe ser mayor que cero');
      }

      if (concept.isEmpty) {
        throw Exception('El concepto no puede estar vacío');
      }

      if (owner.isEmpty) {
        throw Exception('El propietario no puede estar vacío');
      }

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final user_account = prefs.getString('card_account');

      if (token == null || user_account == null) {
        throw Exception('Token de autenticación o cuenta del remitente faltante');
      }

      final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/transferences',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'amount': amount,
          'user_account': user_account,
          'receptor_account': receptor_account.toString(),
          'concept': concept,
          'owner': owner,
        },
      );

      print('Código de estado de la respuesta: ${response.statusCode}');
      print('Datos de la respuesta: ${response.data}');

      if (response.statusCode == 201) {
        final data = response.data;

        if (data['status'] == 'Success' && data['data'] != null) {
          return transferirModel.fromJson(data['data']);
        } else {
          throw Exception('Formato de respuesta inesperado: ${response.data}');
        }
      } else {
        throw Exception('Error al agregar la transferencia. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al agregar la transferencia: $e');
      throw Exception('Error al agregar la transferencia: $e');
    }
  }
}
