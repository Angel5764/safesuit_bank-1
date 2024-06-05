import 'package:safesuit_bank/core/domain/models/transferModel.dart';
import 'package:safesuit_bank/core/domain/repositories/transfer_repository.dart';


class LoadTransData {
  final TransRepository repository;
  LoadTransData(this.repository);

  Future<TransferModel> call() async {
    final transData = await repository.loadFormData();
// Validaciones
    if (transData.numbercardtransfer.isEmpty) {
      throw Exception("El numero de tarjeta no puede estar vacío");
    }
    if (transData.numbercardtransfer.length < 16) {
      throw Exception("El numero de tarjeta debe tener al menos 16 caracteres");
    }
    if (!_esCarateres(transData.ownertransfer)) {
      throw Exception("El nombre de usuario solo puede contener letras");
    }
    if (transData.amountransfer < 0) {
      throw Exception("La cantidad a transferir debe ser mayor a 0");
    }
    if (!_esDouble(transData.amountransfer)) {
      throw Exception("La cantidad a transferir debe ser un número válido con dos decimales");
    }
    if (!_esDouble(transData.amountransfer)) {
      throw Exception("El saldo de transferencia debe ser un número válido con dos decimales");
    }

    return transData;
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