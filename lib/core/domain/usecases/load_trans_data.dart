import 'package:safesuit_bank/core/domain/models/transferModel.dart';
import 'package:safesuit_bank/core/domain/repositories/transfer_repository.dart';

class LoadTransData {
  final TransRepository repository;

  LoadTransData(this.repository);

  Future<List<TransferModel>> call() async {
    final List<TransferModel> transData = await repository.loadFormData();
    // Validaciones adicionales si es necesario
    return transData;
  }
}
