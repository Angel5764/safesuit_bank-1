import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/repositories/pagarcfe_repository.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/cfe/pagarcfe_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/cfe/pagarcfe_state.dart';

class PagarcfeBloc extends Bloc<PagarcfeEvent, PagarcfeState> {
  final PagarcfeRepository pagarcfeRepository;

  PagarcfeBloc({required this.pagarcfeRepository})
      : super(PagarcfeInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<PagarcfeState> emit) async {
    emit(PagarcfeILoading());
      final pagar = await pagarcfeRepository.loadFormData(
        Numservices: event.Numservices,
        Importe: event.importe,
      );
      emit(PagarcfeAuthenticated(pagar: pagar));
  }
}
