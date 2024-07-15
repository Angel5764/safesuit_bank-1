import 'package:json_annotation/json_annotation.dart';

part 'retiroqr_model.g.dart';

@JsonSerializable()
class RetiroqrModel {
  final String name;
  final String lastname;
  final double saldoDisponible;

  RetiroqrModel({
    required this.name,
    required this.lastname,
    required this.saldoDisponible,
  });

  factory RetiroqrModel.fromJson(Map<String, dynamic> json) => _$RetiroqrModelFromJson(json);

  Map<String, dynamic> toJson() => _$RetiroqrModelToJson(this);
}
