import 'package:safesuit_bank/core/domain/models/pagarcfeModel.dart';

abstract class PagarcfeRepository{
  Future<pagartelcelModel> loadFormData();
}