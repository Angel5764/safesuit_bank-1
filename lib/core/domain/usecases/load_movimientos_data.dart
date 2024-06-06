import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';
import 'package:safesuit_bank/core/domain/repositories/movimientos_repository.dart';

class LoadMovimientosData {
  final MovimientosRepository repository;

  LoadMovimientosData(this.repository);

  Future<MovimientosModel> call() async {
    final movimientosData = await repository.loadFormData();

    if (movimientosData.username.isEmpty) {
      throw Exception("El nombre de usuario no puede estar vacío");
    }
    if (movimientosData.username.length < 3) {
      throw Exception("El nombre de usuario debe tener al menos 3 caracteres");
    }
    if (!_esCarateres(movimientosData.username)) {
      throw Exception("El nombre de usuario solo puede contener letras");
    }
    if (movimientosData.monto < 0) {
      throw Exception("El monto debe ser mayor a 0");
    }
    if (!_esDouble(movimientosData.monto)) {
      throw Exception("El monto debe ser un número válido con dos decimales");
    }
    if (movimientosData.fecha.isAfter(DateTime.now())) {
      throw Exception("La fecha no puede ser en el futuro");
    }
    if (movimientosData.hora.isAfter(DateTime.now())) {
      throw Exception("La hora no puede ser en el futuro");
    }

    return movimientosData;
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
