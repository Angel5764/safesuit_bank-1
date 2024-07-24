// load_pagaraguakan_repository.dart
import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagaraguakan_repository.dart';

class LoadPagaraguakanData {

  Future<pagaraguakanModel> call() async {
    final pagarAguakanData = pagaraguakanModel(NIA: '232312321219', Importe: 500);
    // Validaciones
    if (pagarAguakanData.NIA.isEmpty || !esNIAValido(pagarAguakanData.NIA)) {
      throw Exception("NIA está vacío o no es válido");
    }
    if (!esDouble(pagarAguakanData.Importe) || pagarAguakanData.Importe <= 200) {
      throw Exception("El importe debe ser un número positivo mayor a 200");
    }

    return pagarAguakanData;
  }

  bool esNIAValido(String nia) {
    final RegExp niaExp = RegExp(r'^\d{12}$');
    return niaExp.hasMatch(nia);
  }

  bool esDouble(double value) {
    final decimalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    return decimalRegex.hasMatch(value.toString());
  }
}
