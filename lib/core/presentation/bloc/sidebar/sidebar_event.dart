import 'package:equatable/equatable.dart';

abstract class SidebarEvent extends Equatable {
  const SidebarEvent();

  @override
  List<Object> get props => [];
}

class LoadSidebarDataEvent extends SidebarEvent {}

class SidebarPerfilChanged extends SidebarEvent {
  final String username;
  final String email;

  const SidebarPerfilChanged(this.username, this.email);

  @override
  List<Object> get props => [username, email];
}

class SidebarUsernameChanged extends SidebarEvent {
  final String username;

  const SidebarUsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

class SidebarEmailChanged extends SidebarEvent {
  final String email;

  const SidebarEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}
