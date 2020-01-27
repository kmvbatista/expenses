import 'package:expenses/widgets/user_transactions.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text(
                'Chart',
              ),
              elevation: 5,
            ),
          ),
          UserTransation()
        ],
      ),
    );
  }
}
