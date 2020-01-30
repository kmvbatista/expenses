import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function deleteExpense;

  TransactionList(this.transactionList, this.deleteExpense);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactionList
            .map((tx) => Container(
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(child: Text('\$${tx.amount}')),
                        ),
                      ),
                      title: Text(tx.title),
                      subtitle: Text(DateFormat('dd/MM/yyyy').format(tx.date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => deleteExpense(tx.id),
                      ),
                    ),
                  ),
                ))
            .toList());
  }
}
