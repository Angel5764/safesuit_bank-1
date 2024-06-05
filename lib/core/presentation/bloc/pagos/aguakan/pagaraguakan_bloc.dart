import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_pagaraguakan_repository.dart'
    as usecase;
import 'pagaraguakan_event.dart';
import 'pagaraguakan_state.dart';

class PagaraguakanBloc extends Bloc<PagaraguakanEvent, PagaraguakanState> {
  final usecase.LoadPagaraguakanData loadpagaraguakanData;

  PagaraguakanBloc(this.loadpagaraguakanData) : super(const PagaraguakanState()) {
    on<LoadPagaraguakanDataEvent>((event, emit) async {
      final PagaraguakanData = await loadpagaraguakanData();
      emit(PagaraguakanState.fromModel(PagaraguakanData));
    });

    on<LoadPagaraguakanDataEvent>((event, emit) {
      emit(state.copyWith(
        Importe: event.importe,
      ));
    });
  }
}
