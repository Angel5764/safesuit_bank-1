import 'package:safesuit_bank/core/domain/models/userRegisterModel.dart';
import 'package:safesuit_bank/core/domain/repositories/userRegister_repository.dart';

class LoadUserRegisterData {
  final UserRegisterRepository repository;

  LoadUserRegisterData(this.repository);

  Future<UserRegisterModel> call() async {
    final userData = await repository.loadFormData();

    // Validaciones
    if (userData.name.isEmpty) {
      throw Exception("El nombre no puede estar vacío");
    }
    if (userData.lastName.isEmpty) {
      throw Exception("El apellido no puede estar vacío");
    }
    if (userData.email.isEmpty || !_esEmail(userData.email)) {
      throw Exception("Debe proporcionar un correo electrónico válido");
    }
    if (userData.rfc.isEmpty || userData.rfc.length != 13) {
      throw Exception("El RFC debe tener 13 caracteres");
    }
    if (userData.phone.isEmpty) {
      throw Exception("El teléfono debe tener 10 dígitos");
    }
    if (userData.password.isEmpty || userData.password.length < 6) {
      throw Exception("La contraseña debe tener al menos 6 caracteres");
    }

    return userData;
  }

  bool _esEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  bool _esNumero(String str) {
    final numberRegex = RegExp(r'^\d+$');
    return numberRegex.hasMatch(str);
  }
}
