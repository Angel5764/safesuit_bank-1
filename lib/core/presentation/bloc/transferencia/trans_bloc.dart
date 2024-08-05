import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/models/transferModel.dart';
import 'package:safesuit_bank/core/domain/usecases/load_trans_data.dart' as usecase;
import 'package:safesuit_bank/data/repositories/transfer_repository_impl.dart';
import 'trans_event.dart';
import 'trans_state.dart';

class TransferenciaBloc extends Bloc<TransferEvent, TransState> {
  final usecase.LoadTransData loadTransData;
  final TransferRepositoryImpl repository;

  TransferenciaBloc(this.loadTransData, this.repository) : super(const TransState()) {
    on<LoadTransferDataEvent>(
      (event, emit) async {
        try {
          final List<TransferModel> transfers = await loadTransData();
          if (transfers.isNotEmpty) {
            emit(TransState(transfers: transfers));
          } else {
            emit(TransState.empty());
          }
        } catch (e) {
          emit(TransStateError('Error loading data: $e'));
        }
      },
    );

    on<AddTransferEvent>(
      (event, emit) async {
        try {
          await repository.addTransfer(
            event.nickname,
            event.email,
            event.phone,
            event.bankname,
            event.account,
          );
          final List<TransferModel> updatedTransfers = await loadTransData();
          emit(TransState(transfers: updatedTransfers));
        } catch (e) {
          emit(TransStateError('Error adding contact: $e'));
        }
      },
    );
  }
}
