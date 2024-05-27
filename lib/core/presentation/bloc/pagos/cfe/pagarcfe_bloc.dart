import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_pagarcfe_repository.dart'
    as usecase;
import 'pagarcfe_event.dart';
import 'pagarcfe_state.dart';

class PagarcfeBloc extends Bloc<PagarcfeEvent, PagarcfeState> {
  final usecase.LoadPagarcfeData loadPagarcfeData;

  PagarcfeBloc(this.loadPagarcfeData) : super(const PagarcfeState()) {
    on<LoadPagarcfeDataEvent>((event, emit) async {
      final PagarcfeData = await loadPagarcfeData();
      emit(PagarcfeState.fromModel(PagarcfeData));
    });

    on<LoadPagarcfeDataEvent>((event, emit) {
      emit(state.copyWith(
        Importe: event.importe,
      ));
    });
  }
}
