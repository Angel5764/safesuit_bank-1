// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagaraguakanModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

pagaraguakanModel _$pagaraguakanModelFromJson(Map<String, dynamic> json) =>
    pagaraguakanModel(
      NIA: json['NIA'] as String,
      Importe: (json['Importe'] as num).toDouble(),
    );

Map<String, dynamic> _$pagaraguakanModelToJson(pagaraguakanModel instance) =>
    <String, dynamic>{
      'NIA': instance.NIA,
      'Importe': instance.Importe,
    };
