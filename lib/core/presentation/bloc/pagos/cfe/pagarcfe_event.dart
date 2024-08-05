// pagaraguakan_event.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class PagarcfeEvent extends Equatable {
  const PagarcfeEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends PagarcfeEvent {
  final String Numservices;
  final double importe;
  final BuildContext context;
  
  const LoginButtonPressed({
    required this.Numservices,
    required this.importe,
    required this.context,
  });

  List<Object> get props => [Numservices, importe, context];
}
