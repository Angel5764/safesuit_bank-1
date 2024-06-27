import 'package:equatable/equatable.dart';
import 'package:safesuit_bank/core/domain/models/userModel.dart';

class UserState
    extends Equatable {
  final String
      name;
  final String
      lastName;
  final String
      telefono;
  final String
      email;
  final String
      password;
  final double
      money;

  const UserState({
    this.name =
        '',
    this.lastName =
        '',
    this.telefono =
        '',
    this.email =
        '',
    this.password =
        '',
    this.money =
        5000,
  });

  UserState
      copyWith({
    String?
        name,
    String?
        lastName,
    String?
        telefono,
    String?
        email,
    String?
        password,
    double?
        money,
  }) {
    return UserState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      password: password ?? this.password,
      money: money ?? this.money,
    );
  }

  @override
  List<Object> get props =>
      [
        name,
        lastName,
        telefono,
        email,
        password,
        money
      ];

  factory UserState.fromModel(
      UserModel model) {
    return UserState(
      name: model.name,
      lastName: model.lastName,
      telefono: model.telefono,
      email: model.email,
      password: model.password,
      money: model.money,
    );
  }
}
