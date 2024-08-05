import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';

abstract class MovimientosRepository {
  Future<List<MovimientosModel>> loadFormData();
}