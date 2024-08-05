import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/pagartelcelModel.dart';

abstract class PagartelcelState extends Equatable {
  const PagartelcelState();

  @override
  List<Object> get props => [];
}

class PagartelcelInitial extends PagartelcelState {}

class PagartelcelILoading extends PagartelcelState {}

class PagartelcelAuthenticated extends PagartelcelState {
  final pagartelcelModel pagar;
  final bool bamdera;

  const PagartelcelAuthenticated({required this.pagar, this.bamdera = false});

  PagartelcelAuthenticated copyWith({
    pagartelcelModel? pagar,
    bool? bandera,
  }) {
    return PagartelcelAuthenticated(
      pagar: pagar ?? this.pagar,
      bamdera: bandera ?? this.bamdera,
    );
  }

  @override
  List<Object> get props => [pagar, bamdera];
}

class PagartelcelAuthenticationFailure extends PagartelcelState {
  final String error;

  const PagartelcelAuthenticationFailure(this.error);

  @override
  List<Object> get props => [error];
}
