import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';

class LoadPagaraguakanData {
  Future<pagaraguakanModel> call() async {
    return pagaraguakanModel(NIA: "501102101202", Importe: 800.50);
  }
}
