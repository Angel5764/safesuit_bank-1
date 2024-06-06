import 'package:safesuit_bank/core/domain/models/userModel.dart';

class LoadUserData {
  Future<UserModel> call() async {
    final userData = UserModel(
      name: 'Sergio',
      lastName: "Cadenas",
      telefono: "1223344556",
      email: "sergio@gmail.com",
      password: "asasf",
      money: 20000,
    );

    // Validaciones
    if (userData.name.isEmpty || !_esCarateres(userData.name)) {
      throw Exception("El nombre no puede estar vacío y solo debe contener letras");
    }
    if (userData.lastName.isEmpty || !_esCarateres(userData.lastName)) {
      throw Exception("El apellido no puede estar vacío y solo debe contener letras");
    }
    if (userData.telefono.isEmpty || !_esUnTelefono(userData.telefono)) {
      throw Exception("El número de teléfono está vacío o no es un número válido");
    }
    if (userData.email.isEmpty || !_esEmailValido(userData.email)) {
      throw Exception("El correo electrónico está vacío o no es válido");
    }
    if (userData.password.isEmpty || userData.password.length < 6) {
      throw Exception("La contraseña no puede estar vacía y debe tener al menos 6 caracteres");
    }
    if (!_esDouble(userData.money) || userData.money <= 0) {
      throw Exception("El monto de dinero debe ser un número positivo válido");
    }

    return userData;
  }

  bool _esCarateres(String str) {
    final alphaRegex = RegExp(r'^[a-zA-Z]+$');
    return alphaRegex.hasMatch(str);
  }

  bool _esUnTelefono(String phoneNumber) {
    final RegExp phoneExp = RegExp(r'^\d{10}$');
    return phoneExp.hasMatch(phoneNumber);
  }

  bool _esEmailValido(String email) {
    final RegExp emailExp = RegExp(
        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailExp.hasMatch(email);
  }

  bool _esDouble(double value) {
    final decimalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    return decimalRegex.hasMatch(value.toString());
  }
}
