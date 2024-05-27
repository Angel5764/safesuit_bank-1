// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retiroqrModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetiroqrModel _$RetiroqrModelFromJson(Map<String, dynamic> json) =>
    RetiroqrModel(
      username: json['username'] as String,
      cantRetirar: (json['cantRetirar'] as num).toDouble(),
      saldoDisponible: (json['saldoDisponible'] as num).toDouble(),
    );

Map<String, dynamic> _$RetiroqrModelToJson(RetiroqrModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'cantRetirar': instance.cantRetirar,
      'saldoDisponible': instance.saldoDisponible,
    };
