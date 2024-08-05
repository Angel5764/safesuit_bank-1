import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';
import 'package:safesuit_bank/core/domain/repositories/movimientos_repository.dart';

class LoadMovimientosData {
  final MovimientosRepository repository;

  LoadMovimientosData(this.repository);

  Future<List<MovimientosModel>> call() async {
    return await repository.loadFormData();
  }
}
