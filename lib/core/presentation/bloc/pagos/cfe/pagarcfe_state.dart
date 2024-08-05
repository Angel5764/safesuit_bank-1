import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/pagarcfeModel.dart';

abstract class PagarcfeState extends Equatable {
  const PagarcfeState();

  @override
  List<Object> get props => [];
}

class PagarcfeInitial extends PagarcfeState {}

class PagarcfeILoading extends PagarcfeState {}

class PagarcfeAuthenticated extends PagarcfeState {
  final pagarcfeModel pagar;
  final bool bamdera;

  const PagarcfeAuthenticated({required this.pagar, this.bamdera = false});

  PagarcfeAuthenticated copyWith({
    pagarcfeModel? pagar,
    bool? bandera,
  }) {
    return PagarcfeAuthenticated(
      pagar: pagar ?? this.pagar,
      bamdera: bandera ?? this.bamdera,
    );
  }

  @override
  List<Object> get props => [pagar, bamdera];
}

class PagarcfeAuthenticationFailure extends PagarcfeState {
  final String error;

  const PagarcfeAuthenticationFailure(this.error);

  @override
  List<Object> get props => [error];
}
