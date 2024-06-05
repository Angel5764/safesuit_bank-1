import 'package:safesuit_bank/core/domain/models/userModel.dart';

class LoadUserData {
  Future<UserModel> call() async {
    return UserModel(
      name: 'Sergio',
      lastName: "Cadenas",
      telefono: "1223344556",
      email: "sergio@gmail.com",
      password: "asasf",
      money: 20000,
    );
  }
}
