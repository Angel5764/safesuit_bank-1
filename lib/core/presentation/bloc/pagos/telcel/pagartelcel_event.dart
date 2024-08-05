import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';


abstract class PagartelcelEvent extends Equatable {
  const PagartelcelEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends PagartelcelEvent {
  final String NoTelcel;
  final double importe;
  final BuildContext context;
  
  const LoginButtonPressed({
    required this.NoTelcel,
    required this.importe,
    required this.context,
  });

  List<Object> get props => [NoTelcel, importe, context];
}