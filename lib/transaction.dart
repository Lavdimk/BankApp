class Transaction {
  final bool isCredit;
  final double amount;
  final String description;
  final DateTime date;

  Transaction({
    required this.isCredit,
    required this.amount,
    required this.description,
    required this.date,
  });
}
