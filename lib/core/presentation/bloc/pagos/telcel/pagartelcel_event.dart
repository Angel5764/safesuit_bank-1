import 'package:equatable/equatable.dart';

abstract class PagartelcelEvent extends Equatable {
  const PagartelcelEvent();

  @override
  List<Object> get props => [];
}

class LoadPagartelcelDataEvent extends PagartelcelEvent {}

class ImporteChanged extends PagartelcelEvent {
  final double importe;

  const ImporteChanged(this.importe);
  @override
  List<Object> get props => [importe];
}
