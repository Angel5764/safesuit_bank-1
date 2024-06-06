import 'package:json_annotation/json_annotation.dart';
part 'userRegisterModel.g.dart';

@JsonSerializable()
class UserRegisterModel {
  final String name;
  final String lastName;
  final String email;
  final String rfc;
  final String phone;
  final String password;

  UserRegisterModel({
    required this.name,
    required this.lastName,
    required this.email,
    required this.rfc,
    required this.phone,
    required this.password,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => _$UserRegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegisterModelToJson(this);
}
