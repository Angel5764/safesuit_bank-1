// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagarcfeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

pagartelcelModel _$pagarcfeModelFromJson(Map<String, dynamic> json) =>
    pagartelcelModel(
      Numservices: json['Numservices'] as String,
      Importe: (json['Importe'] as num).toDouble(),
    );

Map<String, dynamic> _$pagarcfeModelToJson(pagartelcelModel instance) =>
    <String, dynamic>{
      'Numservices': instance.Numservices,
      'Importe': instance.Importe,
    };
