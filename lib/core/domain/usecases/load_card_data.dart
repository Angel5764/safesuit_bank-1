import 'package:safesuit_bank/core/domain/models/cardModel.dart';

class LoadCardData {
  Future<CardModel> call() async {
    final cardData = CardModel(
      number: '0000000000000000',
      ccv: 123,
      expireDate: "12/26",
      owner: "Sergio",
      bankName: "SafeSuitBank",
    );

    // Validaciones
    if (cardData.number.isEmpty || !_esNumeroDeTarjeta(cardData.number)) {
      throw Exception("El número de tarjeta está vacío o no es válido");
    }
    if (!_esCCVValido(cardData.ccv)) {
      throw Exception("El CCV no es válido");
    }
    if (cardData.expireDate.isEmpty || !_esFechaExpiracionValida(cardData.expireDate)) {
      throw Exception("La fecha de expiración está vacía o no es válida");
    }
    if (cardData.owner.isEmpty || !_esCarateres(cardData.owner)) {
      throw Exception("El nombre del propietario no puede estar vacío y solo debe contener letras");
    }
    if (cardData.bankName.isEmpty || cardData.bankName.length < 3) {
      throw Exception("El nombre del banco no puede estar vacío y debe tener al menos 3 caracteres");
    }

    return cardData;
  }

  bool _esNumeroDeTarjeta(String str) {
    final cardNumberRegex = RegExp(r'^\d{16}$');
    return cardNumberRegex.hasMatch(str);
  }

  bool _esCCVValido(int ccv) {
    final ccvRegex = RegExp(r'^\d{3}$');
    return ccvRegex.hasMatch(ccv.toString());
  }

  bool _esFechaExpiracionValida(String expireDate) {
    final expireDateRegex = RegExp(r'^\d{2}/\d{2}$');
    return expireDateRegex.hasMatch(expireDate);
  }

  bool _esCarateres(String str) {
    final alphaRegex = RegExp(r'^[a-zA-Z]+$');
    return alphaRegex.hasMatch(str);
  }
}
