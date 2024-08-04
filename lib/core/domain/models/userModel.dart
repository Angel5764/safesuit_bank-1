import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  @JsonKey(name: 'lastname')
  final String lastName;
  @JsonKey(name: 'phone')
  final String telefono;
  final String email;

  UserModel({
    required this.name,
    required this.lastName,
    required this.telefono,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
