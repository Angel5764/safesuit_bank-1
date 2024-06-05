import 'package:safesuit_bank/core/domain/models/retiroqrModel.dart';
import 'package:safesuit_bank/core/domain/repositories/retiroqr_repository.dart';

class LoadRetiroData {
  final RetiroqrRepository repository;

  LoadRetiroData(this.repository);

  Future<RetiroqrModel> call() async {
    final retiroData = await repository.loadRetiroData();

    // Validaciones
    if (retiroData.username.isEmpty) {
      throw Exception("Username cannot be empty");
    }
    if (retiroData.cantRetirar <= 0) {
      throw Exception("Amount to withdraw must be greater than zero");
    }
    if (retiroData.saldoDisponible < retiroData.cantRetirar) {
      throw Exception("Insufficient available balance");
    }

    return retiroData;
  }
}
