import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';

abstract class MovimientosRepository{
  Future<MovimientosModel> loadFormData();
}