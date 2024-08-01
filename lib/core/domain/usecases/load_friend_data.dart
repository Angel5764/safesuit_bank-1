// ignore_for_file: non_constant_identifier_names

import 'package:safesuit_bank/core/domain/models/friendModel.dart';
import 'package:safesuit_bank/core/domain/repositories/friend_repository.dart';

class FriendData {
  final FriendRepository repository;

  FriendData(this.repository);

  Future<FriendModel> call() async {
    final FriendData = await repository.loadFormData();
// Validaciones
    if (FriendData.name.isEmpty) {
    print("El nombre del banco no puede estar vacío");
    }
    if (FriendData.name.length < 3) {
      print("El nombre del banco debe tener al menos 3 caracteres");
    }
    if (!_esCarateres(FriendData.name)) {
      print("El nombre de usuario solo puede contener letras");
    }
    if (!_esNumeroDeTarjeta(FriendData.cardNumber)) {
      print("El número de tarjeta solo puede contener dígitos");
    }

    return FriendData;
  }

  bool _esCarateres(String str) {
    final alphaRegex = RegExp(r'^[a-zA-Z]+$');
    return alphaRegex.hasMatch(str);
  }
  bool _esNumeroDeTarjeta(String str) {
    final cardNumberRegex = RegExp(r'^\d{16}$');
    return cardNumberRegex.hasMatch(str);
  }
}