import 'package:equatable/equatable.dart';

abstract class PagarcfeEvent extends Equatable {
  const PagarcfeEvent();

  @override
  List<Object> get props => [];
}

class LoadPagarcfeDataEvent extends PagarcfeEvent {
    get importe => null;
}

class ImporteChanged extends PagarcfeEvent {
  final double Importe;

  const ImporteChanged(this.Importe);
  @override
  List<Object> get props => [Importe];
}
