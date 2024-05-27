import 'package:json_annotation/json_annotation.dart';
part 'retiroqrModel.g.dart';

@JsonSerializable()
class RetiroqrModel {

  final String username;
  final double cantRetirar;
  final double saldoDisponible;

  RetiroqrModel ({required this.username,
  required this.cantRetirar,
  required this.saldoDisponible,
  });

  factory RetiroqrModel.fromJson(Map<String, dynamic> json) => _$RetiroqrModelFromJson(json);
  Map<String, dynamic> toJson() => _$RetiroqrModelToJson(this);
}