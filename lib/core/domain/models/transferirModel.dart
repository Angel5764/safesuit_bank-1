// import 'package:safesuit_bank/core/domain/entities/transfer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'transferirModel.g.dart';

@JsonSerializable()
class transferirModel{
  final int? receptor_account;
  final int amount;
  final String concept;
  final String owner;

  transferirModel ({
    required this.receptor_account,
    required this.amount,
    required this.concept,
    required this.owner,
  });

  factory transferirModel.fromJson(Map<String, dynamic> json) => 
      _$transferirModelFromJson(json);
  Map<String, dynamic> toJson() => _$transferirModelToJson(this);
  
}