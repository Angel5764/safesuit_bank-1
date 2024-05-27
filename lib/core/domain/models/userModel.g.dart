// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      telefono: json['telefono'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      money: (json['money'] as num).toDouble(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'telefono': instance.telefono,
      'email': instance.email,
      'password': instance.password,
      'money': instance.money,
    };
