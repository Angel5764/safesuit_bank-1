// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferirModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

transferirModel _$transferirModelFromJson(Map<String, dynamic> json) =>
    transferirModel(
      user_account: (json['user_account'] as num).toInt(),
      receptor_account: (json['receptor_account'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      concept: json['concept'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$transferirModelToJson(transferirModel instance) =>
    <String, dynamic>{
      'user_account': instance.user_account,
      'receptor_account': instance.receptor_account,
      'amount': instance.amount,
      'concept': instance.concept,
      'owner': instance.owner,
    };
