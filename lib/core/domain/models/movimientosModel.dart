import 'dart:ffi';
// import 'package:safesuit_bank/core/domain/entities/movimientos.dart';

class TransactionModel{
  final String username;
  final Float monto;
  final DateTime fecha;
  final DateTime hora;

  TransactionModel ({
    required this.username,
    required this.monto,
    required this.fecha,
    required this.hora
  });

}
