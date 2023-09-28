import 'transaction.dart';

class TransactionData {
  List<Transaction> transactions = [];

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }
}

final transactionData = TransactionData();
