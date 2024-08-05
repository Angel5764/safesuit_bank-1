import 'package:safesuit_bank/core/domain/models/transferirModel.dart';

abstract class TransferirRepository{
  Future<transferirModel> loadFormData({required int receptor_account, required int amount, required String concept, required String owner});
}