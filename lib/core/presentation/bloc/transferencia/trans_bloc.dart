import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_trans_data.dart' as usecase;
import 'trans_event.dart';
import 'trans_state.dart';

class TransferenciaBloc extends Bloc<TransEvent, TransState> {
  final usecase.LoadTransData loadTransData;

  TransferenciaBloc(this.loadTransData) : super(const TransState()) {
    on<LoadTransDataEvent>((event, emit) async {
      final transData = await loadTransData();
      emit(TransState.fromModel(transData));
    });

    on<LoadTransDataEvent>((event, emit) {
      emit(state.copyWith(
        amountransfer: event.amountransfer,
      ));
    });
  }
}
