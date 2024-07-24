// pagaraguakan_event.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class PagaraguakanEvent extends Equatable {
  const PagaraguakanEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends PagaraguakanEvent {
  final String NIA;
  final double importe;
  final BuildContext context;
  
  const LoginButtonPressed({
    required this.NIA,
    required this.importe,
    required this.context,
  });

  List<Object> get props => [NIA, importe, context];
}
