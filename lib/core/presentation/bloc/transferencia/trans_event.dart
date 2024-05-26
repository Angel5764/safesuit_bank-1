import 'package:equatable/equatable.dart';

abstract class TransEvent extends Equatable {
  const TransEvent();

  @override
  List<Object> get props => [];
}

class LoadTransDataEvent extends TransEvent {
  get amountransfer => null;
}

class CantTransferirChanged extends TransEvent {
  final double amountransfer;

  const CantTransferirChanged(this.amountransfer);

  @override
  List<Object> get props => [amountransfer];
}
