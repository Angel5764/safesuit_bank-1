// import 'package:safesuit_bank/core/domain/entities/pagartelcel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pagartelcelModel.g.dart';

@JsonSerializable()
class pagartelcelModel{
  final String NoTelcel;
  final double Importe;

  pagartelcelModel ({required this.NoTelcel,
    required this.Importe
  });
  
  factory pagartelcelModel.fromJson(Map<String, dynamic> json) => _$pagartelcelModelFromJson(json);
  Map<String, dynamic> toJson() => _$pagartelcelModelToJson(this);
}
