// pagaraguakan_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_pagartelcel_repository.dart' as usecase;
import 'package:safesuit_bank/core/presentation/bloc/pagos/telcel/pagartelcel_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/telcel/pagartelcel_state.dart';

class PagartelcelBloc extends Bloc<PagartelcelEvent, PagartelcelState> {
  final usecase.LoadPagartelcelData loadPagartecelData;

  PagartelcelBloc(this.loadPagartecelData) : super(const PagartelcelState()) {
    on<LoadPagartelcelDataEvent>((event, emit) async {
      try {
        final pagartelcelData = await loadPagartecelData();
        emit(PagartelcelState.fromModel(pagartelcelData));
      } catch (error) {
        emit(state.copyWith(errorMessage: error.toString()));
      }
    });

    on<ImporteChanged>((event, emit) {
      emit(state.copyWith(
        Importe: event.importe, errorMessage: '',
      ));
    });
  }
}
  