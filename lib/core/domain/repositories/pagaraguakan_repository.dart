import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';

abstract class PagaraguakanRepository{
  Future<pagaraguakanModel> loadFormData({required String NIA, required double Importe});
}