import 'package:safesuit_bank/core/domain/models/retiroqrModel.dart';

abstract class RetiroqrRepository{
  Future<RetiroqrModel> loadRetiroData();
}