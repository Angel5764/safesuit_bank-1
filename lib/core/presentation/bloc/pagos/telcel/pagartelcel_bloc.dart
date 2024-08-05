import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/repositories/pagartelcel_repository.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/telcel/pagartelcel_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/telcel/pagartelcel_state.dart';

class PagartelcelBloc extends Bloc<PagartelcelEvent, PagartelcelState> {
  final PagartelcelRepository pagartelcelRepository;

  PagartelcelBloc({required this.pagartelcelRepository})
      : super(PagartelcelInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<PagartelcelState> emit) async {
    emit(PagartelcelILoading());
      final pagar = await pagartelcelRepository.loadFormData(
        NoTelcel: event.NoTelcel,
        Importe: event.importe,
      );
      emit(PagartelcelAuthenticated(pagar: pagar));
  }
}
