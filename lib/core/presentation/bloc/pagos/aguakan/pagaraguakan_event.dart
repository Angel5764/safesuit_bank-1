import 'package:equatable/equatable.dart';

abstract class PagaraguakanEvent extends Equatable {
  const PagaraguakanEvent();

  @override
  List<Object> get props => [];
}

class LoadPagaraguakanDataEvent extends PagaraguakanEvent {
    get importe => null;
}

class ImporteChanged extends PagaraguakanEvent {
  final double Importe;

  const ImporteChanged(this.Importe);
  @override
  List<Object> get props => [Importe];
}
