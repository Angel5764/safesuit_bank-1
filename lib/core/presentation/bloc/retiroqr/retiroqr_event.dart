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
