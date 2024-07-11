// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimientosModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovimientosModel _$MovimientosModelFromJson(Map<String, dynamic> json) =>
    MovimientosModel(
      username: json['username'] as String,
      monto: (json['monto'] as num).toDouble(),
      fecha: DateTime.parse(json['fecha'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$MovimientosModelToJson(MovimientosModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'monto': instance.monto,
      'fecha': instance.fecha.toIso8601String(),
      'status': instance.status,
    };
