import 'package:dio/dio.dart';
import 'package:safesuit_bank/core/domain/models/pagartelcelModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagartelcel_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PagartelcelRepositoryImpl implements PagartelcelRepository {
  final Dio _dio = Dio();

  @override
  Future<pagartelcelModel> loadFormData(
      {required String NoTelcel, required double Importe}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    final idcuenta = prefs.getString('idcuenta');
    final iduser = prefs.getString('idUser');
    final idservicio = prefs.getInt('telcel_id');
    final cantidadenCuenta = prefs.getString('balance');
    if (cantidadenCuenta == null) {
      throw Exception("No se pudo obtener el balance de la cuenta.");
    }
    final balance = double.parse(cantidadenCuenta);
    if (Importe > balance) {
      throw Exception("El importe excede el balance disponible.");
    }
    final servicios = await _dio.get(
      'https://apimoviles-production.up.railway.app/services',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    final response = await _dio.post(
      'https://apimoviles-production.up.railway.app/log-services',
      data: {
        'id_service': idservicio,
        'id_users': iduser,
        'id_account': idcuenta,
        'amount': Importe,
        'reference': NoTelcel
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    print(response.data);
    return pagartelcelModel.fromJson(response.data);
  }
}
