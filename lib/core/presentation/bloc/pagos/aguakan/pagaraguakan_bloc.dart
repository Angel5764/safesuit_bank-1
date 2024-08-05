import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/repositories/pagaraguakan_repository.dart';
import 'pagaraguakan_event.dart';
import 'pagaraguakan_state.dart';

class PagarcfeBloc extends Bloc<PagaraguakanEvent, PagaraguakanState> {
  final PagaraguakanRepository pagaraguakanRepository;

  PagarcfeBloc({required this.pagaraguakanRepository})
      : super(PagaraguakanInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<PagaraguakanState> emit) async {
    emit(PagaraguakanILoading());
      final pagar = await pagaraguakanRepository.loadFormData(
        NIA: event.NIA,
        Importe: event.importe,
      );
      emit(PagaraguakanAuthenticated(pagar: pagar));
  }
}
