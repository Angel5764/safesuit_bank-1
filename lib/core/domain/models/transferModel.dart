// import 'package:safesuit_bank/core/domain/entities/transfer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'transferModel.g.dart';

@JsonSerializable()
class TransferModel{
  final int id;
  final int id_user;
  final String nickname;
  final String email;
  final String phone;
  final String bankname;
  final String account;

  TransferModel ({
    required this.id,
    required this.id_user,
    required this.nickname,
    required this.email,
    required this.phone,
    required this.bankname,
    required this.account
  });

  factory TransferModel.fromJson(Map<String, dynamic> json) => 
      _$TransferModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransferModelToJson(this);
  
}