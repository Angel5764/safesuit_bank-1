// pagaraguakan_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_pagarcfe_repository.dart' as usecase;
import 'package:safesuit_bank/core/presentation/bloc/pagos/cfe/pagarcfe_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/cfe/pagarcfe_state.dart';

class PagarcfeBloc extends Bloc<PagarcfeEvent, PagarcfeState> {
  final usecase.LoadPagarcfeData loadPagarcfeData;

  PagarcfeBloc(this.loadPagarcfeData) : super(const PagarcfeState()) {
    on<LoadPagarcfeDataEvent>((event, emit) async {
      try {
        final pagarcfenData = await loadPagarcfeData();
        emit(PagarcfeState.fromModel(pagarcfenData));
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
  