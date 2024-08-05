
class TransferenciaEntity{
  final int receptor_account;
  final int amount;
  final String concept;
  final String owner;

  TransferenciaEntity ({
    required this.receptor_account,
    required this.amount,
    required this.concept,
    required this.owner,
  });
}