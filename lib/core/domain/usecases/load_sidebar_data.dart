import 'package:safesuit_bank/core/domain/models/sidebarModel.dart';
import 'package:safesuit_bank/core/domain/repositories/sidebar_repository.dart';

class LoadSidebarData {
  final SidebarRepository repository;

  LoadSidebarData(this.repository);

  Future<SidebarModel> call() async {
    final sidebarData = await repository.loadFormData();

    // Validaciones
    if (sidebarData.accountName.isEmpty) {
      throw Exception("El nombre de usuario no puede estar vacío");
    }
    if (sidebarData.accountName.length < 3) {
      throw Exception("El nombre de usuario debe tener al menos 3 caracteres");
    }
    if (!_esCarateres(sidebarData.accountName)) {
      throw Exception("El nombre de usuario solo puede contener letras");
    }
    if (sidebarData.accountEmail.isEmpty) {
      throw Exception("El correo electrónico no puede estar vacío");
    }
    if (!_esEmailValido(sidebarData.accountEmail)) {
      throw Exception("El formato del correo electrónico no es válido");
    }

    return sidebarData;
  }

//Verifica si una cadena contiene solo letras (caracteres alfabéticos).
  bool _esCarateres(String str) {
    final alphaRegex = RegExp(r'^[a-zA-Z]+$');
    return alphaRegex.hasMatch(str);
  }

//Verifica si una cadena tiene un formato de correo electrónico válido.
  bool _esEmailValido(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }
}
