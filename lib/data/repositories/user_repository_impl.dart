import 'package:safesuit_bank/core/domain/models/userModel.dart';
import 'package:safesuit_bank/core/domain/repositories/user_repository.dart';
import 'package:safesuit_bank/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio _dio = Dio();
  final ApiService _apiService = ApiService();

  @override
  Future<UserModel> loadFormData({required String phoneNumber, required String password}) async {
    try {
      final response = await _dio.post(
        'https://apimoviles-production.up.railway.app/auth/login',
        data: {
          "phone": phoneNumber,
          "password": password,
        },
      );

      print("Respuesta completa de la API: ${response.data}");

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          final token = data['access_token'];
          print("Token recibido: $token");

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);

          final savedToken = prefs.getString('auth_token');
          print("Token guardado: $savedToken");

          // Obtener el perfil del usuario usando el token
          final userData = await _apiService.getUserProfile(token);
          print("Datos del usuario: $userData");
          
          // Obtener la card para las transferencias
          final userData2 = await _apiService.getCardProfile(token);
          print("Datos de la tarjeta: $userData2");

          // Guardar el card_account en SharedPreferences
          final cardAccount = userData2['data']['card'][0]['card'];
          await prefs.setString('card_account', cardAccount);
          print("Card Account guardado: $cardAccount");

          return UserModel.fromJson(userData['data']); // Ajuste para extraer solo 'data'
        } else {
          throw Exception('Formato de respuesta inválido: no es un JSON válido.');
        }
      } else {
        throw Exception('Error en la autenticación: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      // Captura los errores específicos de Dio
      String errorMessage = _handleDioError(e);
      print(errorMessage); // Imprime el mensaje amigable
      throw Exception(errorMessage); // Lanza una excepción con el mensaje amigable
    } catch (e) {
      print("Error durante la autenticación: $e");
      throw Exception('Error en la autenticación: $e');
    }
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    print("Token eliminado");
  }

  // Función para manejar errores de Dio
  String _handleDioError(DioError e) {
    switch (e.response?.statusCode) {
      case 400:
        return 'Solicitud incorrecta. Verifica tus credenciales.';
      case 401:
        return 'No autorizado. Por favor, verifica tu usuario y contraseña.';
      case 403:
        return 'Acceso denegado. No tienes permisos para realizar esta acción.';
      case 404:
        return 'No encontrado. El recurso solicitado no está disponible.';
      case 500:
        return 'Error en el servidor. Por favor, intenta más tarde.';
      default:
        return 'Ocurrió un error inesperado. Por favor, intenta más tarde.';
    }
  }
}
