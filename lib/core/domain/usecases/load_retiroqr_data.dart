import 'package:safesuit_bank/core/domain/models/retiroqrModel.dart';

class LoadRetiroData {
  Future<RetiroqrModel> call() async {
    return RetiroqrModel(
      username: 'exampleUser',
      cantRetirar: 100.0,
      saldoDisponible: 500.0,
    );
  }
}