import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/models/transferirModel.dart';
import 'package:safesuit_bank/core/domain/usecases/load_transferir_data.dart';
import 'transferencia_event.dart';
import 'transferencia_state.dart';

class MandaTransferenciaBloc extends Bloc<MandaTransferenciaEvent, MandaTransferenciaState> {
  final LoadTransData loadTransData;

  MandaTransferenciaBloc(this.loadTransData) : super(MandaTransferenciaInitial()) {
    on<AgregarTransferenciaEvent>((event, emit) async {
      emit(MandaTransferenciaLoading());
      try {
        // Llamada al caso de uso para cargar datos
        final transfer = await loadTransData(
          receptorAccount: event.receptorAccount,
          amount: event.amount,
          concept: event.concept,
          owner: event.owner,
        );

        emit(MandaTransferenciaSuccess(transfer));
      } catch (e, stacktrace) {
        print('Error al agregar la transferencia: $e');
        print('Detalles del error: $stacktrace');
        emit(MandaTransferenciaError('Error al agregar la transferencia: $e'));
      }
    });
  }
}
