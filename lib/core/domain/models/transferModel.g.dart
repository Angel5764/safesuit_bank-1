// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferModel _$TransferModelFromJson(Map<String, dynamic> json) =>
    TransferModel(
      numbercardtransfer: json['numbercardtransfer'] as String,
      ownertransfer: json['ownertransfer'] as String,
      bankNametransfer: json['bankNametransfer'] as String,
      amountransfer: (json['amountransfer'] as num).toDouble(),
    );

Map<String, dynamic> _$TransferModelToJson(TransferModel instance) =>
    <String, dynamic>{
      'numbercardtransfer': instance.numbercardtransfer,
      'ownertransfer': instance.ownertransfer,
      'bankNametransfer': instance.bankNametransfer,
      'amountransfer': instance.amountransfer,
    };
