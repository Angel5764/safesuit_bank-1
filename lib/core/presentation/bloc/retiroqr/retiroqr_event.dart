import 'package:equatable/equatable.dart';

abstract class RetiroEvent extends Equatable {
  const RetiroEvent();

  @override
  List<Object> get props => [];
}

class LoadRetiroDataEvent extends RetiroEvent {}

class CantRetirarChanged extends RetiroEvent {
  final double cantRetirar;

  const CantRetirarChanged(this.cantRetirar);

  @override
  List<Object> get props => [cantRetirar];
}

class UsernameChanged extends RetiroEvent {
  final String username;

  const UsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

class SaldoDisponibleChanged extends RetiroEvent {
  final double saldoDisponible;

  const SaldoDisponibleChanged(this.saldoDisponible);

  @override
  List<Object> get props => [saldoDisponible];
}

class QrSubmitted extends RetiroEvent {}
