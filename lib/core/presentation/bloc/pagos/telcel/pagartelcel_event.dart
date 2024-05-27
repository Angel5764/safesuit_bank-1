import 'package:equatable/equatable.dart';

abstract class PagartelcelEvent extends Equatable {
  const PagartelcelEvent();

  @override
  List<Object> get props => [];
}

class LoadPagartelcelDataEvent extends PagartelcelEvent {
    get importe => null;
}

class ImporteChanged extends PagartelcelEvent {
  final double Importe;

  const ImporteChanged(this.Importe);
  @override
  List<Object> get props => [Importe];
}
