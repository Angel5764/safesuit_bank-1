import 'package:safesuit_bank/core/domain/models/retiroqr_model.dart';

abstract class RetiroqrRepository{
  Future<RetiroqrModel> loadRetiroData();
}