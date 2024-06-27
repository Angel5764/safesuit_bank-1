// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      money: (json['money'] as num).toDouble(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'money': instance.money,
    };
