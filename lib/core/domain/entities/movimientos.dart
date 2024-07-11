class TransactionEntity {
  final String username;
  final double monto;
  final DateTime fecha;
  final String status;

  TransactionEntity({
    required this.username,
    required this.monto,
    required this.fecha,
    required this.status,
  });
}
