import 'package:equatable/equatable.dart';

abstract class SidebarEvent extends Equatable {
  const SidebarEvent();

  @override
  List<Object> get props => [];
}

class LoadSidebarDataEvent extends SidebarEvent {}

class SidebarPerfilChanged extends SidebarEvent {
  final String accountName;
  final String accountEmail;

  const SidebarPerfilChanged(this.accountName, this.accountEmail);

  @override
  List<Object> get props => [accountName, accountEmail];
}

class SidebarUsernameChanged extends SidebarEvent {
  final String accountName;

  const SidebarUsernameChanged(this.accountName);

  @override
  List<Object> get props => [accountName];
}

class SidebarEmailChanged extends SidebarEvent {
  final String accountEmail;

  const SidebarEmailChanged(this.accountEmail);

  @override
  List<Object> get props => [accountEmail];
}
