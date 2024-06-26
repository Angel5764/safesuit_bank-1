import 'package:safesuit_bank/core/domain/models/pagarcfeModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagarcfe_repository.dart';

class LoadPagarcfeData {
  final PagarcfeRepository repository;

  LoadPagarcfeData(this.repository);

  Future<pagartelcelModel> call() async {
    final pagarCfeData = await repository.loadFormData();

    // Validaciones
    if (pagarCfeData.Numservices.isEmpty || !_numeroCFEValido(pagarCfeData.Numservices)) {
      throw Exception("Número de servicio está vacío o no es válido");
    }
    if (pagarCfeData.Importe <= 200) {
      throw Exception("El importe debe ser un número positivo y solo debes que ingresar dos decimales");
    }

    return pagarCfeData;
  }

  bool _numeroCFEValido(String serviceNumber) {
    final RegExp serviceExp = RegExp(r'^\d{12}$');
    return serviceExp.hasMatch(serviceNumber);
  }
}
