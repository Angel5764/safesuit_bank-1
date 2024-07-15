// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retiroqr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetiroqrModel _$RetiroqrModelFromJson(Map<String, dynamic> json) =>
    RetiroqrModel(
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      saldoDisponible: (json['saldoDisponible'] as num).toDouble(),
    );

Map<String, dynamic> _$RetiroqrModelToJson(RetiroqrModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastname,
      'saldoDisponible': instance.saldoDisponible,
    };
