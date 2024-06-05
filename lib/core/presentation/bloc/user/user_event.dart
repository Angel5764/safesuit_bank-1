import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserDataEvent extends UserEvent {
  get amounUser => null;
}

class CantUserChanged extends UserEvent {
  final double amounUser;

  const CantUserChanged(this.amounUser);

  @override
  List<Object> get props => [amounUser];
}
