import 'package:flutter/material.dart';
import '../../providers/transaction.dart';
import 'package:provider/provider.dart';

class TransactionListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transaction = context.read<Transaction>();

    return Text(transaction.title);
  }
}
