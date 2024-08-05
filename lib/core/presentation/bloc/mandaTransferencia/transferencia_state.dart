import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/transferirModel.dart';

abstract class MandaTransferenciaState extends Equatable {
  const MandaTransferenciaState();

  @override
  List<Object> get props => [];
}

class MandaTransferenciaInitial extends MandaTransferenciaState {}

class MandaTransferenciaLoading extends MandaTransferenciaState {}

class MandaTransferenciaSuccess extends MandaTransferenciaState {
  final transferirModel transferencia;

  const MandaTransferenciaSuccess(this.transferencia);

  @override
  List<Object> get props => [transferencia];
}

class MandaTransferenciaError extends MandaTransferenciaState {
  final String message;

  const MandaTransferenciaError(this.message);

  @override
  List<Object> get props => [message];
}
