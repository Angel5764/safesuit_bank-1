// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagartelcelModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

pagartelcelModel _$pagartelcelModelFromJson(Map<String, dynamic> json) =>
    pagartelcelModel(
      NoTelcel: json['NoTelcel'] as String,
      Importe: (json['Importe'] as num).toDouble(),
    );

Map<String, dynamic> _$pagartelcelModelToJson(pagartelcelModel instance) =>
    <String, dynamic>{
      'NoTelcel': instance.NoTelcel,
      'Importe': instance.Importe,
    };
