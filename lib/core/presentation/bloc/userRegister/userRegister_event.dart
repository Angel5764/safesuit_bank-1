import 'package:equatable/equatable.dart';

abstract class UserRegisterEvent extends Equatable {
  const UserRegisterEvent();

  @override
  List<Object> get props => [];
}
class LoadUserDataEvent extends UserRegisterEvent {
  @override
  List<Object> get props => [];
}
class NameChanged extends UserRegisterEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object> get props => [name];
}
class LastNameChanged extends UserRegisterEvent {
  final String lastName;

  const LastNameChanged(this.lastName);

  @override
  List<Object> get props => [lastName];
}
class EmailChanged extends UserRegisterEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}
class RfcChanged extends UserRegisterEvent {
  final String rfc;

  const RfcChanged(this.rfc);

  @override
  List<Object> get props => [rfc];
}
class PhoneChanged extends UserRegisterEvent {
  final String phone;

  const PhoneChanged(this.phone);

  @override
  List<Object> get props => [phone];
}
class PasswordChanged extends UserRegisterEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}
class SubmitUserRegister extends UserRegisterEvent {
  @override
  List<Object> get props => [];
}
