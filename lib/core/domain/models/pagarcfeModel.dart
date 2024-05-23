// import 'package:safesuit_bank/core/domain/entities/pagarcfe.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pagarcfeModel.g.dart';

@JsonSerializable()
class pagarcfeModel{
  final String Numservices;
  final double Importe;

  pagarcfeModel ({required this.Numservices,
    required this.Importe
  });
  
  factory pagarcfeModel.fromJson(Map<String, dynamic> json) => _$pagarcfeModelFromJson(json);
  Map<String, dynamic> toJson() => _$pagarcfeModelToJson(this);
}
