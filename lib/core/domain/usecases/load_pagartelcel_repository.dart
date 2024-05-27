import 'package:safesuit_bank/core/domain/models/pagartelcelModel.dart';

class LoadPagartelcelData {
  Future<pagartelcelModel> call() async {
    return pagartelcelModel(NoTelcel: "501102101202", Importe: 800.50);
  }
}
