import 'package:safesuit_bank/core/domain/models/transferModel.dart';
import 'package:safesuit_bank/core/domain/repositories/transfer_repository.dart';

class LoadTransData {
  final TransRepository repository;

  LoadTransData(this.repository);

  Future<TransferModel> call() async {
    final transData = await repository.loadFormData();
// Validaciones
    if (transData.numbercardtransfer.isEmpty) {
      print("El numero de tarjeta no puede estar vacío");
    }
    if (transData.ownertransfer.isEmpty || transData.bankNametransfer.isEmpty) {
      print("Todos los campos son obligatorios");
    }
    if (transData.bankNametransfer.isEmpty) {
    print("El nombre del banco no puede estar vacío");
    }
    if (transData.bankNametransfer.length < 3) {
      print("El nombre del banco debe tener al menos 3 caracteres");
    }
    if (transData.numbercardtransfer.length < 16) {
      print("El numero de tarjeta debe tener al menos 16 caracteres");
    }
    if (!_esCarateres(transData.ownertransfer)) {
      print("El nombre de usuario solo puede contener letras");
    }
    if (!_esNumeroDeTarjeta(transData.numbercardtransfer)) {
      print("El número de tarjeta solo puede contener dígitos");
    }
    if (transData.amountransfer < 0) {
      print("La cantidad a transferir debe ser mayor a 0");
    }
    if (transData.amountransfer <= 0) {
      print("La cantidad a transferir debe ser mayor a 0");
    }
    if (transData.amountransfer > 10000) {
      print("La cantidad a transferir no puede exceder los 10,000");
    }

    if (!_esDouble(transData.amountransfer)) {
      print("La cantidad a transferir debe ser un número válido con dos decimales");
    }
    if (!_esDouble(transData.amountransfer)) {
      print("El saldo de transferencia debe ser un número válido con dos decimales");
    }

    return transData;
  }

  bool _esCarateres(String str) {
    final alphaRegex = RegExp(r'^[a-zA-Z]+$');
    return alphaRegex.hasMatch(str);
  }
  bool _esNumeroDeTarjeta(String str) {
    final cardNumberRegex = RegExp(r'^\d{16}$');
    return cardNumberRegex.hasMatch(str);
  }
  bool _esDouble(double value) {
    final decimalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    return decimalRegex.hasMatch(value.toString());
  }
}