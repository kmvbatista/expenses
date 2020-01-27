import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:expenses/widgets/new_transaction.dart';
import 'package:expenses/widgets/transactionList.dart';

class UserTransation extends StatefulWidget {
  @override
  _UserTransationState createState() => _UserTransationState();
}

class _UserTransationState extends State<UserTransation> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New shoes', amount: 69, date: DateTime.now()),
    Transaction(id: 't2', title: 'New chair', amount: 16, date: DateTime.now()),
    Transaction(id: 't12', title: 'New bag', amount: 10, date: DateTime.now()),
    Transaction(id: 't3', title: 'New shirt', amount: 59, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        id: DateTime.now().toString(),
        date: DateTime.now());
    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(() => _addNewTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
