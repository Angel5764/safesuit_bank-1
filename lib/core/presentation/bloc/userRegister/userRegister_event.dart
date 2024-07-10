import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/userRegisterModel.dart';

abstract class UserRegisterEvent extends Equatable {
  const UserRegisterEvent();
}

class LoadUserRegisterEvent extends UserRegisterEvent {
  @override
  List<Object> get props => [];
}

class NameChanged extends UserRegisterEvent {
  final String name;

  const NameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class LastNameChanged extends UserRegisterEvent {
  final String lastName;

  const LastNameChanged({required this.lastName});

  @override
  List<Object> get props => [lastName];
}

class EmailChanged extends UserRegisterEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class RfcChanged extends UserRegisterEvent {
  final String rfc;

  const RfcChanged({required this.rfc});

  @override
  List<Object> get props => [rfc];
}

class PhoneChanged extends UserRegisterEvent {
  final String phone;

  const PhoneChanged({required this.phone});

  @override
  List<Object> get props => [phone];
}

class PasswordChanged extends UserRegisterEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class SubmitUserRegister extends UserRegisterEvent {
  final UserRegisterModel register;

  const SubmitUserRegister(this.register);

  @override
  List<Object?> get props => [register];
}
