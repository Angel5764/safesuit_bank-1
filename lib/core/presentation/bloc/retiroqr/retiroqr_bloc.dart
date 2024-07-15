import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_retiroqr_data.dart' as usecase;
import 'retiroqr_event.dart';
import 'retiroqr_state.dart';

class RetiroBloc extends Bloc<RetiroEvent, RetiroState> {
  final usecase.LoadRetiroData loadRetiroData;

  RetiroBloc(this.loadRetiroData) : super(const RetiroState()) {
    on<LoadRetiroDataEvent>((event, emit) async {
      try {
        final retiroData = await loadRetiroData();
        emit(RetiroState.fromModel(retiroData));
      } catch (e) {
        emit(state.copyWith(isValid: false));
      }
    });

    // Otros eventos...
  }

  bool _validateForm() {
    return state.name.isNotEmpty && state.lastname.isNotEmpty;
  }
}
