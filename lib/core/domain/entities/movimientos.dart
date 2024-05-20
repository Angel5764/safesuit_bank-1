import 'dart:ffi';

class TransactionEntity {
  final String username;
  final Float monto;
  final DateTime fecha;
  final DateTime hora;

  TransactionEntity({
    required this.username,
    required this.monto,
    required this.fecha,
    required this.hora,
  });
}