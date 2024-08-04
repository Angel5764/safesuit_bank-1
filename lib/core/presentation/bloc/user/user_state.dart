import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/userModel.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserAuthenticated extends UserState {
  final UserModel user;

  const UserAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class UserAuthenticationFailure extends UserState {
  final String error;

  const UserAuthenticationFailure({required this.error});

  @override
  List<Object> get props => [error];
}
