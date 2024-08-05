import 'package:safesuit_bank/core/domain/models/pagarcfeModel.dart';

class LoadPagarcfeData {
  Future<pagarcfeModel> call() async {
    final pagarCfeData =
        pagarcfeModel(Numservices: '232312321219', Importe: 500);

    // Validaciones
    if (pagarCfeData.Numservices.isEmpty ||
        !numeroCFEValido(pagarCfeData.Numservices)) {
      throw Exception("Número de servicio está vacío o no es válido");
    }
    if (pagarCfeData.Importe <= 200) {
      throw Exception(
          "El importe debe ser un número positivo mayor a 200 y no puede iniciar con 0");
    }
    if (pagarCfeData.Importe > 10000) {
      throw Exception("El importe no debe exceder los 10,000");
    }

    return pagarCfeData;
  }

  bool numeroCFEValido(String serviceNumber) {
    final RegExp serviceExp = RegExp(r'^\d{12}$');
    return serviceExp.hasMatch(serviceNumber);
  }

  bool esDouble(String value) {
    final decimalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    if (value.startsWith('0') && value != '0' && !value.startsWith('0.')) {
      return false;
    }
    return decimalRegex.hasMatch(value);
  }
}
