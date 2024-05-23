// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagarcfeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

pagarcfeModel _$pagarcfeModelFromJson(Map<String, dynamic> json) =>
    pagarcfeModel(
      Numservices: json['Numservices'] as String,
      Importe: (json['Importe'] as num).toDouble(),
    );

Map<String, dynamic> _$pagarcfeModelToJson(pagarcfeModel instance) =>
    <String, dynamic>{
      'Numservices': instance.Numservices,
      'Importe': instance.Importe,
    };
