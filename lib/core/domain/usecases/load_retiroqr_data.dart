import 'package:safesuit_bank/core/domain/models/retiroqr_model.dart';
import 'package:safesuit_bank/data/repositories/retiroqr_repository_impl.dart';

class LoadRetiroData {
  final RetiroqrRepositoryImpl repository;

  LoadRetiroData(this.repository);

  Future<RetiroqrModel> call() async {
    final retiroData = await repository.getRetiroData();

    if (retiroData.name.isEmpty) {
      throw Exception("El nombre no puede estar vacío");
    }
    if (retiroData.lastname.isEmpty) {
      throw Exception("El apellido no puede estar vacío");
    }
    if (retiroData.name.length < 3 || retiroData.lastname.length < 3) {
      throw Exception("El nombre y apellido deben tener al menos 3 caracteres");
    }
    if (!_esCaracteres(retiroData.name) || !_esCaracteres(retiroData.lastname)) {
      throw Exception("El nombre y apellido solo pueden contener letras");
    }

    return retiroData;
  }

  bool _esCaracteres(String input) {
    final regExp = RegExp(r'^[a-zA-Z]+$');
    return regExp.hasMatch(input);
  }
}
