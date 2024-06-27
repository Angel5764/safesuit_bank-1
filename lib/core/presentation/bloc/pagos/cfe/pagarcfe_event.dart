// pagaraguakan_event.dart
import 'package:equatable/equatable.dart';

abstract class PagarcfeEvent extends Equatable {
  const PagarcfeEvent();

  @override
  List<Object> get props => [];
}

class LoadPagarcfeDataEvent extends PagarcfeEvent {}

class ImporteChanged extends PagarcfeEvent {
  final double importe;

  const ImporteChanged(this.importe);
  @override
  List<Object> get props => [importe];
}
