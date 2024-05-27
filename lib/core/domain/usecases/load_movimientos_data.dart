import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';

class LoadMovimientosData {
  Future<MovimientosModel> call() async {
    return MovimientosModel(
      username: 'Oxxo',
      monto: 74.50,
      fecha: DateTime.now(),
      hora: DateTime.now()
    );
  }
}