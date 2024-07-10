import 'package:safesuit_bank/core/domain/models/userRegisterModel.dart';
import 'package:safesuit_bank/core/domain/repositories/userRegister_repository.dart';

class SubmitUserRegisterData {
  final UserRegisterRepository repository;

  SubmitUserRegisterData(this.repository);

  Future<void> call(UserRegisterModel user) async {
    await repository.loadFormData(user);

  }
}
