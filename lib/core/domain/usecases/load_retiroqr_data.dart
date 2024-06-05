import 'package:safesuit_bank/core/domain/models/retiroqrModel.dart';
import 'package:safesuit_bank/core/domain/repositories/retiroqr_repository.dart';

class LoadRetiroData {
  final RetiroqrRepository repository;

  LoadRetiroData(this.repository);

  Future<RetiroqrModel> call() async {
    final retiroData = await repository.loadRetiroData();

    // Validaciones
    if (retiroData.username.isEmpty) {
      throw Exception("El nombre de usuario no puede estar vacío");
    }
    if (retiroData.username.length < 3) {
      throw Exception("El nombre de usuario debe tener al menos 3 caracteres");
    }
    if (!_esCarateres(retiroData.username)) {
      throw Exception("El nombre de usuario solo puede contener letras");
    }
    if (retiroData.cantRetirar < 0) {
      throw Exception("La cantidad a retirar debe ser mayor a 0");
    }
    if (!_esDouble(retiroData.cantRetirar)) {
      throw Exception("La cantidad a retirar debe ser un número válido con dos decimales");
    }
    if (!_esDouble(retiroData.saldoDisponible)) {
      throw Exception("El saldo disponible debe ser un número válido con dos decimales");
    }
    if (retiroData.saldoDisponible < retiroData.cantRetirar) {
      throw Exception("Saldo insuficiente");
    }

    return retiroData;
  }

  bool _esCarateres(String str) {
    final alphaRegex = RegExp(r'^[a-zA-Z]+$');
    return alphaRegex.hasMatch(str);
  }

  bool _esDouble(double value) {
    final decimalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    return decimalRegex.hasMatch(value.toString());
  }
}
