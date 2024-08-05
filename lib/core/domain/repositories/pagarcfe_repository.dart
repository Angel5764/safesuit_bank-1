import 'package:safesuit_bank/core/domain/models/pagarcfeModel.dart';

abstract class PagarcfeRepository{
  Future<pagarcfeModel> loadFormData({required String Numservices, required double Importe});
}