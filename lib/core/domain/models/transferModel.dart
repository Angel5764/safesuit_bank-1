// import 'package:safesuit_bank/core/domain/entities/transfer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'transferModel.g.dart';

@JsonSerializable()
class TransferModel{
  final String numbercardtransfer;
  final String ownertransfer;
  final String bankNametransfer;
  final double amountransfer;

  TransferModel ({
    required this.numbercardtransfer,
    required this.ownertransfer,
    required this.bankNametransfer,
    required this.amountransfer
  });

  factory TransferModel.fromJson(Map<String, dynamic> json) => _$TransferModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransferModelToJson(this);
  
}