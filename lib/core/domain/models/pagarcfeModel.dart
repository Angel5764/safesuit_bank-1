// import 'package:safesuit_bank/core/domain/entities/pagarcfe.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pagarcfeModel.g.dart';

@JsonSerializable()
class pagartelcelModel{
  final String Numservices;
  final double Importe;

  pagartelcelModel ({required this.Numservices,
    required this.Importe
  });
  
  factory pagartelcelModel.fromJson(Map<String, dynamic> json) => _$pagarcfeModelFromJson(json);
  Map<String, dynamic> toJson() => _$pagarcfeModelToJson(this);
}
