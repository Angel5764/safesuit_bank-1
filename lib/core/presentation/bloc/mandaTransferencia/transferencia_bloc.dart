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
        final transfer = await loadTransData(
          receptorAccount: event.receptorAccount,
          amount: event.amount,
          concept: event.concept,
          owner: event.owner,
        );

        emit(MandaTransferenciaSuccess(transfer));
      } catch (e) {
        emit(MandaTransferenciaError('Error al agregar la transferencia: $e'));
      }
    });
  }
}
