import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/userRegisterModel.dart';

class UserRegisterState extends Equatable {
  final String name;
  final String lastName;
  final String email;
  final String rfc;
  final String phone;
  final String password;
  final String errorMessage;

  const UserRegisterState({
    this.name = '',
    this.lastName = '',
    this.email = '',
    this.rfc = '',
    this.phone = '',
    this.password = '',
    this.errorMessage = '',
  });

  factory UserRegisterState.fromModel(UserRegisterModel model) {
    return UserRegisterState(
      name: model.name,
      lastName: model.lastName,
      email: model.email,
      rfc: model.rfc,
      phone: model.phone,
      password: model.password,
    );
  }

  UserRegisterState copyWith({
    String? name,
    String? lastName,
    String? email,
    String? rfc,
    String? phone,
    String? password,
    String? errorMessage,
  }) {
    return UserRegisterState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      rfc: rfc ?? this.rfc,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [name, lastName, email, rfc, phone, password, errorMessage];
}
class RegisterInitial extends UserRegisterState {}

class RegisterLoading extends UserRegisterState {}

class RegisterSuccess extends UserRegisterState {}

class RegisterError extends UserRegisterState {
  final String message;

  const RegisterError(this.message);

  @override
  List<Object> get props => [message];
}