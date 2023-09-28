import 'package:flutter/material.dart';
import 'transaction.dart';
import 'transaction_data.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({Key? key});

  final List<Transaction> transactions = transactionData.transactions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transactions",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade200,
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];

          final IconData iconData =
              transaction.isCredit ? Icons.arrow_downward : Icons.arrow_upward;
          final Color iconColor =
              transaction.isCredit ? Colors.green : Colors.red;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400, 
                  shape:
                      BoxShape.circle, 
                ),
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  iconData,
                  color: iconColor,
                ),
              ),
              title: Text(
                transaction.description,
                style: const TextStyle(fontSize: 25),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${transaction.amount.toStringAsFixed(2)} €", 
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: Colors.black, 
                    ),
                  ),
                  Text(
                    "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 29, 154, 203),
                      fontSize: 20, 
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
