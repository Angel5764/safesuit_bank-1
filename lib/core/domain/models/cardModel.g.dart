// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      number: json['number'] as String,
      ccv: (json['ccv'] as num).toInt(),
      expireDate: json['expireDate'] as String,
      owner: json['owner'] as String,
      bankName: json['bankName'] as String,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'number': instance.number,
      'ccv': instance.ccv,
      'expireDate': instance.expireDate,
      'owner': instance.owner,
      'bankName': instance.bankName,
    };
