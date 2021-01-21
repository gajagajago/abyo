import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final Map transaction;

  Transaction(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Text(transaction['title']),
            Text(transaction['amount'].toString()),
            Text(transaction['date'])
          ],
        ),
      ),
    );
  }
}
