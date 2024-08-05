import 'package:safesuit_bank/core/domain/models/pagartelcelModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagartelcel_repository.dart';

class LoadPagartelcelData {

  Future<pagartelcelModel> call() async {
    final pagarTelcelData = pagartelcelModel(NoTelcel: "529982552221", Importe: 50);

    // Validaciones
    if (pagarTelcelData.NoTelcel.isEmpty || !esUnTelefono(pagarTelcelData.NoTelcel)) {
      throw Exception("Numero telcel está vacío o no es un número de teléfono válido");
    }
    if (pagarTelcelData.Importe < 9) {
      throw Exception("El importe debe ser superior a 9");
    }
    if (pagarTelcelData.Importe > 5000) {
      throw Exception("El importe no debe exceder los 5000");
    }

    return pagarTelcelData;
  }

  bool esUnTelefono(String phoneNumber) {
    final RegExp phoneExp = RegExp(r'^998\d{7}$');
    return phoneExp.hasMatch(phoneNumber);
  }

  bool esDouble(String value) {
    final decimalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    return decimalRegex.hasMatch(value.toString());
  }
}
