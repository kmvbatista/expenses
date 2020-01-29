import 'package:expenses/widgets/chart.dart';

import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transactionList.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New shoes', amount: 69, date: DateTime.now()),
    Transaction(id: 't2', title: 'New chair', amount: 16, date: DateTime.now()),
    Transaction(id: 't12', title: 'New bag', amount: 10, date: DateTime.now()),
    Transaction(id: 't3', title: 'New shirt', amount: 59, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return transactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime choosenDate) {
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        id: DateTime.now().toString(),
        date: choosenDate);
    setState(() {
      transactions.add(newTransaction);
    });
  }

  void startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startNewTransaction(context),
      ),
    );
  }
}
