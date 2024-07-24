// pagaraguakan_state.dart
import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';

class PagaraguakanState extends Equatable {
  const PagaraguakanState();

  @override
  List<Object> get props => [];
}

class PagaraguakanInitial extends PagaraguakanState {}

class PagaraguakanILoading extends PagaraguakanState {}

class PagaraguakanAuthenticated extends PagaraguakanState {
  final pagaraguakanModel pagar;

  const PagaraguakanAuthenticated({required this.pagar});

  @override
  List<Object> get props => [pagar];
}

class PagaraguakanAuthenticationFailure extends PagaraguakanState {
  final String error;

  const PagaraguakanAuthenticationFailure({required this.error});

  @override
  List<Object> get props => [error];
}
