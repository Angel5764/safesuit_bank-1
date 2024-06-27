import 'package:safesuit_bank/core/domain/models/retiroqrModel.dart';
import 'package:safesuit_bank/core/domain/repositories/retiroqr_repository.dart';

class LoadRetiroData {
  final RetiroqrRepository repository;

  LoadRetiroData(this.repository);

  Future<RetiroqrModel> call() async {
    final retiroData = await repository.loadRetiroData();

    // Validaciones
    if (retiroData.username.isEmpty) {
      throw Exception("El nombre de usuario no puede estar vacío.");
    }
    if (retiroData.cantRetirar <= 0) {
      throw Exception("La cantidad a retirar debe ser mayor a 0.");
    }
    if (!_esDouble(retiroData.cantRetirar)) {
      throw Exception(
          "La cantidad a retirar debe ser un número válido con dos decimales.");
    }
    if (retiroData.saldoDisponible < 0) {
      throw Exception("El saldo disponible no puede ser negativo.");
    }
    if (!_esDouble(retiroData.saldoDisponible)) {
      throw Exception(
          "El saldo disponible debe ser un número válido con dos decimales.");
    }

    return retiroData;
  }

  bool _esDouble(double value) {
    final decimalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    return decimalRegex.hasMatch(value.toString());
  }
}
