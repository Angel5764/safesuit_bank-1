import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/models/transferModel.dart';
import 'package:safesuit_bank/core/domain/usecases/load_trans_data.dart' as usecase;
import 'trans_event.dart';
import 'trans_state.dart';

class TransferenciaBloc extends Bloc<TransferEvent, TransState> {
  final usecase.LoadTransData loadTransData;

  TransferenciaBloc(this.loadTransData) : super(const TransState()) {
    on<LoadTransferDataEvent>(
      (event, emit) async {
        try {
          final List<TransferModel> transfers = await loadTransData();
          if (transfers.isNotEmpty) {
            // Emitir estado con la lista de transferencias o el primer elemento, según sea necesario
            // En este ejemplo, uso el primer elemento para llenar el estado
            emit(TransState.fromModel(transfers[0]));  // Ajustar si necesitas usar toda la lista
          } else {
            emit(TransState.empty()); // Define un estado vacío si no hay transferencias
          }
        } catch (e) {
          // Manejo de errores en BLoC
          print('Error loading data: $e');
          // Emitir un estado de error si es necesario
        }
      },
    );

    // Manejadores para otros eventos
    on<UserIdTransferChanged>((event, emit) {
      final newState = state.copyWith(
        id: event.idUser,
      );
      emit(newState);
    });

    // ...otros eventos
  }
}
