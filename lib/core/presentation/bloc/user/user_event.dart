import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends UserEvent {
  final String phoneNumber;
  final String password;
  final BuildContext context;

  const LoginButtonPressed({
    required this.phoneNumber,
    required this.password,
    required this.context,
  });

  @override
  List<Object> get props => [phoneNumber, password, context];
}
