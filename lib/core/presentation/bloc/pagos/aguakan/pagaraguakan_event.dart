// pagaraguakan_event.dart
import 'package:equatable/equatable.dart';

abstract class PagaraguakanEvent extends Equatable {
  const PagaraguakanEvent();

  @override
  List<Object> get props => [];
}

class LoadPagaraguakanDataEvent extends PagaraguakanEvent {}

class ImporteChanged extends PagaraguakanEvent {
  final double importe;

  const ImporteChanged(this.importe);
  @override
  List<Object> get props => [importe];
}
