// pagaraguakan_bloc.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/repositories/pagaraguakan_repository.dart';
import 'package:safesuit_bank/core/domain/usecases/load_pagaraguakan_repository.dart' as usecase;
import 'package:safesuit_bank/main.dart';
import 'pagaraguakan_event.dart';
import 'pagaraguakan_state.dart';

class PagaraguakanBloc extends Bloc<PagaraguakanEvent, PagaraguakanState> {
  final PagaraguakanRepository pagaraguakanRepository;
  PagaraguakanBloc({required this.pagaraguakanRepository}): super(PagaraguakanInitial()){
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }
  Future<void> _onLoginButtonPressed(LoginButtonPressed event, Emitter<PagaraguakanState>emit) async{
    emit(PagaraguakanILoading());

  try {
      final pagar = await pagaraguakanRepository.loadFormData(
        NIA: event.NIA,
        Importe: event.importe,
      );
      emit(PagaraguakanAuthenticated(pagar: pagar));
      // Navegar a la siguiente pantalla
      Navigator.of(event.context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
    } catch (error) {
      emit(PagaraguakanAuthenticationFailure(error: error.toString()));
    }
  }
}
  