import 'package:json_annotation/json_annotation.dart';

part 'movimientosModel.g.dart';

@JsonSerializable()
class MovimientosModel {
  final int id;
  final double amount;
  final String senderAccount;
  final String receptorAccount;
  final String concept;
  final String owner;

  MovimientosModel({
    required this.id,
    required this.amount,
    required this.senderAccount,
    required this.receptorAccount,
    required this.concept,
    required this.owner,
  });

  factory MovimientosModel.fromJson(Map<String, dynamic> json) {
    return MovimientosModel(
      id: json['id'] as int? ?? 0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      senderAccount: json['sender_account'] as String? ?? 'Unknown',
      receptorAccount: json['receptor_account'] as String? ?? 'Unknown',
      concept: json['concept'] as String? ?? 'No Concept',
      owner: json['owner'] as String? ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() => _$MovimientosModelToJson(this);
}
