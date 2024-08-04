import 'package:safesuit_bank/core/domain/models/transferModel.dart';

abstract class TransRepository {
  Future<List<TransferModel>> loadFormData();
}

