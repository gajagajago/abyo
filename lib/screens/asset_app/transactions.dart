import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/asset_app/assets_provider.dart';
import '../../providers/asset_app/transactions_provider.dart';
import 'transaction_list_tile.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build transaction list");
    final assetCategoryId = context.watch<AssetsProvider>().assetCategoryId;
    final transactionsProvider = context.watch<TransactionsProvider>();
    final transactions = transactionsProvider.transactions(assetCategoryId);

    return transactionsProvider.loading
        ? Container(child: Center(child: CircularProgressIndicator()))
        : ListView.builder(
            itemBuilder: (context, int idx) => ChangeNotifierProvider.value(
              value: transactions[idx],
              child: TransactionListTile(),
            ),
            itemCount: transactions.length,
          );
  }
}
