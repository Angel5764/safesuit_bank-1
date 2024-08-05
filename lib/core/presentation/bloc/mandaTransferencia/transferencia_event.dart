import 'package:equatable/equatable.dart';

abstract class MandaTransferenciaEvent extends Equatable {
  const MandaTransferenciaEvent();

  @override
  List<Object> get props => [];
}

class AgregarTransferenciaEvent extends MandaTransferenciaEvent {
  final int receptorAccount;
  final int amount;
  final String concept;
  final String owner;

  const AgregarTransferenciaEvent({
    required this.receptorAccount,
    required this.amount,
    required this.concept,
    required this.owner,
  });

  @override
  List<Object> get props => [receptorAccount, amount, concept, owner];
}
