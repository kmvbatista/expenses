import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  DateTime selectedDate;
  final amountController = TextEditingController();

  void submitData() {
    if (amountController.text.isNotEmpty &&
        titleController.text.isNotEmpty &&
        double.parse(amountController.text) >= 0) {
      widget.addNewTransaction(
          titleController.text, double.parse(amountController.text));
      Navigator.of(context).pop();
    }
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text(selectedDate == null
                      ? 'No Date chosen'
                      : DateFormat.yMd().format(selectedDate)),
                  FlatButton(
                    child: Text('Choose Date'),
                    onPressed: presentDatePicker,
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text('Add transaction'),
              textColor: Theme.of(context).primaryColor,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
