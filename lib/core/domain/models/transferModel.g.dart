// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferModel _$TransferModelFromJson(Map<String, dynamic> json) =>
    TransferModel(
      id: (json['id'] as num).toInt(),
      id_user: (json['id_user'] as num).toInt(),
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      bankname: json['bankname'] as String,
      account: json['account'] as String,
    );

Map<String, dynamic> _$TransferModelToJson(TransferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.id_user,
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'bankname': instance.bankname,
      'account': instance.account,
    };
