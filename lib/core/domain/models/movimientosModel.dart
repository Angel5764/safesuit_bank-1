// import 'package:safesuit_bank/core/domain/entities/movimientos.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movimientosModel.g.dart';

@JsonSerializable()
class MovimientosModel{
  final String username;
  final double monto;
  final DateTime fecha;
  final DateTime hora;

  MovimientosModel ({
    required this.username,
    required this.monto,
    required this.fecha,
    required this.hora
  });

  factory MovimientosModel.fromJson(Map<String, dynamic> json) => _$MovimientosModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovimientosModelToJson(this);

}
