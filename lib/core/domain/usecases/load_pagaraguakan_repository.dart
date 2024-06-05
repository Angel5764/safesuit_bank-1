import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';
import 'package:safesuit_bank/core/domain/repositories/pagaraguakan_repository.dart';

class LoadPagaraguakanData {
  final PagaraguakanRepository repository;

  LoadPagaraguakanData(this.repository);

  Future<pagaraguakanModel> call() async {
    final pagarAguakanData = await repository.loadFormData();

    // Validaciones
    if (pagarAguakanData.NIA.isEmpty || !_esNIAValido(pagarAguakanData.NIA)) {
      throw Exception("NIA está vacío o no es válido");
    }
    if (_esDouble(pagarAguakanData.Importe) || pagarAguakanData.Importe <= 200) {
      throw Exception("El importe debe ser un número positivo");
    }

    return pagarAguakanData;
  }

  bool _esNIAValido(String nia) {
    final RegExp niaExp = RegExp(r'^\d{12}$');
    return niaExp.hasMatch(nia);
  }
  bool _esDouble(double value) {
    final decimalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    return decimalRegex.hasMatch(value.toString());
  }
}

