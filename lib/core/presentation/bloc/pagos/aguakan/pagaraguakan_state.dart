import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/pagaraguakanModel.dart';

abstract class PagaraguakanState extends Equatable {
  const PagaraguakanState();

  @override
  List<Object> get props => [];
}

class PagaraguakanInitial extends PagaraguakanState {}

class PagaraguakanILoading extends PagaraguakanState {}

class PagaraguakanAuthenticated extends PagaraguakanState {
  final pagaraguakanModel pagar;
  final bool bamdera;

  const PagaraguakanAuthenticated({required this.pagar, this.bamdera = false});

  PagaraguakanAuthenticated copyWith({
    pagaraguakanModel? pagar,
    bool? bandera,
  }) {
    return PagaraguakanAuthenticated(
      pagar: pagar ?? this.pagar,
      bamdera: bandera ?? this.bamdera,
    );
  }

  @override
  List<Object> get props => [pagar, bamdera];
}

class PagaraguakanAuthenticationFailure extends PagaraguakanState {
  final String error;

  const PagaraguakanAuthenticationFailure(this.error);

  @override
  List<Object> get props => [error];
}
