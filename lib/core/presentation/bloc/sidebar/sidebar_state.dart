import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/sidebarModel.dart';

class SidebarState extends Equatable {
  final String accountName;
  final String accountEmail;

  const SidebarState({
    this.accountName = '',
    this.accountEmail = '',
  });

  SidebarState copyWith({
    String? accountName,
    String? accountEmail,
  }) {
    return SidebarState(
      accountName: accountName ?? this.accountName,
      accountEmail: accountEmail ?? this.accountEmail,
    );
  }

  @override
  List<Object> get props => [accountName, accountEmail];

  factory SidebarState.fromModel(SidebarModel model) {
    return SidebarState(
      accountName: model.accountName,
      accountEmail: model.accountEmail,
    );
  }
}
