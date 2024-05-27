import 'package:json_annotation/json_annotation.dart';
part 'userModel.g.dart';

// import 'package:safesuit_bank/core/domain/entities/user.dart';

@JsonSerializable()
class UserModel {

  final String name;
  final String lastName;
  final String telefono;
  final String email;
  final String password;
  final double money;

  UserModel ({required this.name,
    required this.lastName,
    required this.telefono,
    required this.email,
    required this.password,
    required this.money
  });

factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
Map <String, dynamic> toJson() => _$UserModelToJson(this);
}