// pagaraguakan_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_pagaraguakan_repository.dart' as usecase;
import 'pagaraguakan_event.dart';
import 'pagaraguakan_state.dart';

class PagaraguakanBloc extends Bloc<PagaraguakanEvent, PagaraguakanState> {
  final usecase.LoadPagaraguakanData loadPagaraguakanData;

  PagaraguakanBloc(this.loadPagaraguakanData) : super(const PagaraguakanState()) {
    on<LoadPagaraguakanDataEvent>((event, emit) async {
      try {
        final pagaraguakanData = await loadPagaraguakanData();
        emit(PagaraguakanState.fromModel(pagaraguakanData));
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
