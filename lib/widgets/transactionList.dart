import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  TransactionList(this.transactionList);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: FittedBox(
                        child: Text('\$${transactionList[index].amount}')),
                  ),
                ),
                title: Text(transactionList[index].title),
                subtitle: Text(DateFormat('dd/MM/yyyy')
                    .format(transactionList[index].date)),
              ),
            );
          },
          itemCount: transactionList.length,
        ));
  }
}
