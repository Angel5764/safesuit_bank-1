// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userRegisterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterModel _$UserRegisterModelFromJson(Map<String, dynamic> json) =>
    UserRegisterModel(
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      rfc: json['rfc'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserRegisterModelToJson(UserRegisterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'rfc': instance.rfc,
      'phone': instance.phone,
      'password': instance.password,
    };
