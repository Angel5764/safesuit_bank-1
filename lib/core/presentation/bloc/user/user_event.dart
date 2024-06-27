import 'package:equatable/equatable.dart';

abstract class UserEvent
    extends Equatable {
  const UserEvent();

  @override
  List<Object> get props =>
      [];
}

class LoadUserDataEvent
    extends UserEvent {}

class CantUserChanged
    extends UserEvent {
  final double
      amounUser;

  const CantUserChanged(
      this.amounUser);

  @override
  List<Object> get props =>
      [
        amounUser
      ];
}

class UserNameChanged
    extends UserEvent {
  final String
      name;
  final String
      lastName;

  const UserNameChanged(
      this.name,
      this.lastName);

  @override
  List<Object> get props =>
      [
        name,
        lastName
      ];
}
