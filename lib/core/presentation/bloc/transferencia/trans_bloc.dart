import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_trans_data.dart' as usecase;
import 'trans_event.dart';
import 'trans_state.dart';

class TransferenciaBloc extends Bloc<TransEvent, TransState> {
  final usecase.LoadTransData loadTransData;

  TransferenciaBloc(this.loadTransData) : super(const TransState()) {
    on<LoadTransDataEvent>(
      (event, emit) async {
        final retiroData = await loadTransData();
        emit(TransState.fromModel(retiroData));
      },
    );

    on<numbercardtransferChanged>((event, emit) {
      final newState = state.copyWith(
        numbercardtransfer: event.numbercardtransfer,
      );
      emit(newState);
    });

    on<ownertransferChanged>((event, emit) {
      final newState = state.copyWith(
        ownertransfer: event.ownertransfer,
      );
      emit(newState);
    });

    on<bankNametransferChanged>((event, emit) {
      final newState = state.copyWith(
        bankNametransfer: event.bankNametransfer,
      );
      emit(newState);
    });

    on<amountransferChanged>((event, emit) {
      final newState = state.copyWith(
        amountransfer: event.amountransfer,
      );
      emit(newState);
    });
  }
}
