import 'package:safesuit_bank/core/domain/models/transferirModel.dart';
import 'package:safesuit_bank/core/domain/repositories/transferir_repository.dart';

class LoadTransData {
  final TransferirRepository repository;

  LoadTransData(this.repository);

  Future<transferirModel> call({
    required int receptorAccount,
    required int amount,
    required String concept,
    required String owner,
  }) async {
    final transData = await repository.loadFormData(
      receptor_account: receptorAccount,
      amount: amount,
      concept: concept,
      owner: owner,
    );
    return transData;
  }
}
