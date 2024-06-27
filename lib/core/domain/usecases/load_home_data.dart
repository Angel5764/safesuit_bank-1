import 'package:safesuit_bank/core/domain/models/homeModel.dart';
import 'package:safesuit_bank/core/domain/repositories/home_repository.dart';

class LoadHomeData {
  final HomeRepository
      repository;
  LoadHomeData(
      this.repository);
  Future<HomeModel>
      call() async {
    final homeData =
        await repository.loadHomeData();
    _validateHomeData(homeData);
    return homeData;
  }

  void _validateHomeData(
      HomeModel homeData) {
    if (homeData.name.isEmpty) {
      throw Exception("El nombre no puede estar vacío");
    }
    if (homeData.name.length <
        3) {
      throw Exception("El nombre debe tener al menos 3 caracteres");
    }
    if (!_esSoloLetras(homeData.name)) {
      throw Exception("El nombre solo puede contener letras y espacios");
    }

    if (homeData.lastName.isEmpty) {
      throw Exception("El apellido no puede estar vacío");
    }
    if (homeData.lastName.length <
        3) {
      throw Exception("El apellido debe tener al menos 3 caracteres");
    }
    if (!_esSoloLetras(homeData.lastName)) {
      throw Exception("El apellido solo puede contener letras y espacios");
    }

    if (homeData.money <=
        0) {
      throw Exception("El dinero debe ser mayor a 0");
    }
    if (!_esDoubleConDosDecimales(homeData.money)) {
      throw Exception("El dinero debe ser un número válido con hasta dos decimales");
    }
  }

  // Validar si la cadena solo contiene letras y espacios
  bool _esSoloLetras(
      String str) {
    final alphaRegex =
        RegExp(r'^[a-zA-Z\s]+$');
    return alphaRegex.hasMatch(str);
  }

  // Validar si el valor es un número con hasta dos decimales
  bool _esDoubleConDosDecimales(
      double value) {
    final decimalRegex =
        RegExp(r'^\d+(\.\d{1,2})?$');
    return decimalRegex.hasMatch(value.toString());
  }
}
