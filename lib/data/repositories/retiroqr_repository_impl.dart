import 'package:safesuit_bank/core/domain/models/retiroqr_model.dart';
import 'package:safesuit_bank/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetiroqrRepositoryImpl {
  final ApiService apiService;

  RetiroqrRepositoryImpl({required this.apiService});

  Future<RetiroqrModel> getRetiroData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token == null) {
      throw Exception('Token no encontrado');
    }

    final response = await apiService.getUserProfile(token);
    return RetiroqrModel.fromJson(response);
  }
}
