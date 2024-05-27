// import 'package:safesuit_bank/core/domain/entities/pagaraguakan.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pagaraguakanModel.g.dart';

@JsonSerializable()
class pagaraguakanModel{
  final String NIA;
  final double Importe;

  pagaraguakanModel ({required this.NIA,
    required this.Importe
  });

  factory pagaraguakanModel.fromJson(Map<String, dynamic> json) => _$pagaraguakanModelFromJson(json);
  Map<String, dynamic> toJson() => _$pagaraguakanModelToJson(this);
}
