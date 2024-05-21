import 'dart:ffi';

// import 'package:safesuit_bank/core/domain/entities/user.dart';

class UserModel {

  final String name;
  final String lastName;
  final String telefono;
  final String email;
  final String password;
  final Float money;

  UserModel ({required this.name,
    required this.lastName,
    required this.telefono,
    required this.email,
    required this.password,
    required this.money
  });

}