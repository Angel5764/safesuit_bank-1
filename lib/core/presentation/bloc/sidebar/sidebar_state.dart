import 'package:equatable/equatable.dart';

class SidebarState extends Equatable {
  final String accountName;
  final String accountEmail;
  final String errorMessage;

  const SidebarState({
    this.accountName = '',
    this.accountEmail = '',
    this.errorMessage = '',
  });

  SidebarState copyWith({
    String? accountName,
    String? accountEmail,
    String? errorMessage,
  }) {
    return SidebarState(
      accountName: accountName ?? this.accountName,
      accountEmail: accountEmail ?? this.accountEmail,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory SidebarState.fromModel(dynamic model) {
    return SidebarState(
      accountName: model.accountName,
      accountEmail: model.accountEmail,
    );
  }

  @override
  List<Object> get props => [accountName, accountEmail, errorMessage];
}
