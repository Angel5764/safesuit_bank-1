import 'package:safesuit_bank/core/domain/models/userModel.dart';
import 'package:safesuit_bank/core/domain/repositories/user_repository.dart';

class LoadUserData {
  final UserRepository
      repository;

  LoadUserData(
      this.repository);

  Future<UserModel>
      call() async {
    try {
      final userData = await repository.loadFormData();

      // Validaciones
      if (userData.name.isEmpty || !_esCaracteres(userData.name)) {
        throw Exception("El nombre no puede estar vacío y solo debe contener letras");
      }
      if (userData.lastName.isEmpty || !_esCaracteres(userData.lastName)) {
        throw Exception("El apellido no puede estar vacío y solo debe contener letras");
      }
      if (userData.telefono.isEmpty || !_esUnTelefono(userData.telefono)) {
        throw Exception("El número de teléfono está vacío o no es un número válido");
      }
      if (userData.email.isEmpty || !_esEmailValido(userData.email)) {
        throw Exception("El correo electrónico está vacío o no es válido");
      }
      if (userData.password.isEmpty || userData.password.length < 6) {
        throw Exception("La contraseña no puede estar vacía y debe tener al menos 6 caracteres");
      }
      if (userData.money <= 0) {
        throw Exception("El monto de dinero debe ser un número positivo válido");
      }

      return userData;
    } catch (error) {
      throw Exception("Error al cargar datos del usuario: $error");
    }
  }

  // Validaciones auxiliares
  bool _esCaracteres(
      String str) {
    final alphaRegex =
        RegExp(r'^[a-zA-Z]+$');
    return alphaRegex.hasMatch(str);
  }

  bool _esUnTelefono(
      String phoneNumber) {
    final RegExp
        phoneExp =
        RegExp(r'^\d{10}$');
    return phoneExp.hasMatch(phoneNumber);
  }

  bool _esEmailValido(
      String email) {
    final RegExp
        emailExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailExp.hasMatch(email);
  }
}
