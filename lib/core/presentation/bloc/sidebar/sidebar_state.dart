import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/sidebarModel.dart';

class SidebarState extends Equatable {
  final String username;
  final String email;

  const SidebarState({
    this.username = '',
    this.email = '',
  });

  SidebarState copyWith({
    String? username,
    String? email,

  }) {
    return SidebarState(
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [username, email];

  factory SidebarState.fromModel(SidebarModel model) {
    return SidebarState(
      username: model.username,
      email: model.email
    );
  }
}
