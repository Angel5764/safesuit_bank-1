class TransactionEntity {
  final int id;
  final double amount;
  final String senderAccount;
  final String receptorAccount;
  final String concept;
  final String owner;

  TransactionEntity({
    required this.id,
    required this.amount,
    required this.senderAccount,
    required this.receptorAccount,
    required this.concept,
    required this.owner,
  });
}
