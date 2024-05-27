import 'package:safesuit_bank/core/domain/models/pagartelcelModel.dart';

abstract class PagartelcelRepository{
  Future<pagartelcelModel> loadFormData();
}