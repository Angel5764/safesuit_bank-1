import 'package:safesuit_bank/core/domain/models/pagarcfeModel.dart';

class LoadPagarcfeData {
  Future<pagarcfeModel> call() async {
    return pagarcfeModel(Numservices: "501102101202", Importe: 800.50);
  }
}
