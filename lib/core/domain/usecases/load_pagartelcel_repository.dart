import 'package:safesuit_bank/core/domain/models/pagartelcelModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagartelcel_repository.dart';

class LoadPagartelcelData {
  final PagartelcelRepository repository;

  LoadPagartelcelData(this.repository);

  Future<pagartelcelModel> call() async {
    final pagarTelcelData = await repository.loadFormData();

    // Validaciones
    if (pagarTelcelData.NoTelcel.isEmpty || !_esUnTelefono(pagarTelcelData.NoTelcel)) {
      throw Exception("Numero telcel está vacío o no es un número de teléfono válido");
    }
    if (pagarTelcelData.Importe < 9) {
      throw Exception("El importe debe ser superior a 9");
    }

    return pagarTelcelData;
  }

  bool _esUnTelefono(String phoneNumber) {
    final RegExp phoneExp = RegExp(r'^\+?52\d{10}$');
    return phoneExp.hasMatch(phoneNumber);
  }
  bool _esDouble(double value) {
    final decimalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    return decimalRegex.hasMatch(value.toString());
  }
}
