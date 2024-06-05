import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_pagartelcel_repository.dart'
    as usecase;
import 'pagartelcel_event.dart';
import 'pagartelcel_state.dart';

class PagartelcelBloc extends Bloc<PagartelcelEvent, PagartelcelState> {
  final usecase.LoadPagartelcelData loadPagartelcelData;

  PagartelcelBloc(this.loadPagartelcelData) : super(const PagartelcelState()) {
    on<LoadPagartelcelDataEvent>((event, emit) async {
      final PagartelcelData = await loadPagartelcelData();
      emit(PagartelcelState.fromModel(PagartelcelData));
    });

    on<LoadPagartelcelDataEvent>((event, emit) {
      emit(state.copyWith(
        Importe: event.importe,
      ));
    });
  }
}
