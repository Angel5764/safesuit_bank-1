// ignore_for_file: camel_case_types

import 'package:equatable/equatable.dart';

abstract class TransEvent extends Equatable {
  const TransEvent();

  @override
  List<Object> get props => [];
}

class LoadTransDataEvent extends TransEvent {}

class numbercardtransferChanged extends TransEvent {
  final String numbercardtransfer;

  const numbercardtransferChanged(this.numbercardtransfer);

  @override
  List<Object> get props => [numbercardtransfer];
}

class ownertransferChanged extends TransEvent {
  final String ownertransfer;

  const ownertransferChanged(this.ownertransfer);

  @override
  List<Object> get props => [ownertransfer];
}

class bankNametransferChanged extends TransEvent {
  final String bankNametransfer;

  const bankNametransferChanged(this.bankNametransfer);

  @override
  List<Object> get props => [bankNametransfer];
}

class amountransferChanged extends TransEvent {
  final double amountransfer;

  const amountransferChanged(this.amountransfer);

  @override
  List<Object> get props => [amountransfer];
}