import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/transactions_provider.dart';
import '../../providers/authenticate.dart';
import 'transaction_list_tile.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransactionsProvider(authToken: context.read<Authenticate>().authToken),
      child: TransactionsList(),
    );
  }
}

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionsProvider = context.watch<TransactionsProvider>();

    return transactionsProvider.loading
        ? Container(child: Center(child: CircularProgressIndicator()))
        : ListView.builder(
            itemBuilder: (context, int idx) => ChangeNotifierProvider(
              create: (_) => transactionsProvider.transactions[idx],
              child: TransactionListTile(),
            ),
            itemCount: transactionsProvider.transactions.length,
          );
  }
}
