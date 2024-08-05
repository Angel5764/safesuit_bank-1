// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimientosModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovimientosModel _$MovimientosModelFromJson(Map<String, dynamic> json) =>
    MovimientosModel(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      senderAccount: json['senderAccount'] as String,
      receptorAccount: json['receptorAccount'] as String,
      concept: json['concept'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$MovimientosModelToJson(MovimientosModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'senderAccount': instance.senderAccount,
      'receptorAccount': instance.receptorAccount,
      'concept': instance.concept,
      'owner': instance.owner,
    };
