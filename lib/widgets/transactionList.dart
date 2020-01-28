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
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      '\$${transactionList[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.purple)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactionList[index].title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMd().format(transactionList[index].date),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: transactionList.length,
        ));
  }
}
