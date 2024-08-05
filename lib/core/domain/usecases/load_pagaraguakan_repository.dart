import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagaraguakan_repository.dart';

class LoadPagaraguakanData {
  Future<pagaraguakanModel> call() async {
    final pagarAguakanData =
        pagaraguakanModel(NIA: '232312321219', Importe: 500);
    // Validaciones
    if (pagarAguakanData.NIA.isEmpty || !esNIAValido(pagarAguakanData.NIA)) {
      throw Exception("NIA está vacío o no es válido");
    }
    if (pagarAguakanData.Importe <= 200) {
      throw Exception(
          "El importe debe ser un número positivo mayor a 200 y no puede iniciar con 0");
    }
    if (pagarAguakanData.Importe > 10000) {
      throw Exception("El importe no debe exceder los 10,000");
    }
    return pagarAguakanData;
  }

  bool esNIAValido(String nia) {
    final RegExp niaExp = RegExp(r'^\d{12}$');
    return niaExp.hasMatch(nia);
  }

  bool esDouble(String value) {
    final decimalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    if (value.startsWith('0') && value != '0' && !value.startsWith('0.')) {
      return false;
    }
    return decimalRegex.hasMatch(value);
  }
}
