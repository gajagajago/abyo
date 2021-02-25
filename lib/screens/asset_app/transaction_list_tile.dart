import 'package:flutter/material.dart';
import '../../providers/asset_app/transaction.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../helpers/helper_function.dart';
import '../../providers/asset_app/assets_provider.dart';
import '../../providers/asset_app/transactions_provider.dart';
import '../../providers/user_auth/authenticate.dart';

class TransactionListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transaction = context.read<Transaction>();
    final assetsProvider = context.read<AssetsProvider>();
    final transactionsProvider = context.read<TransactionsProvider>();
    final authToken = context.read<Authenticate>().authToken;

    return Dismissible(
      key: ValueKey(transaction.id),
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: AlignmentDirectional.centerEnd,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Map<String, int> params = {
          'asset_id': transaction.asset['id'],
          'transaction_id': transaction.id,
        };
        transactionsProvider.destroyTransaction(params: params, authToken: authToken).then((val) {
          print("VAL: $val");
          if (val) {
            Future.delayed(const Duration(milliseconds: 0), () {
              assetsProvider.fetchAssets(authToken);
              transactionsProvider.fetchTransactions(authToken);
            });
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HelperFunction().assetCategory(transaction.asset['category']),
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Text(
                    DateFormat("yyyy-MM-dd").format(DateTime.parse(transaction.time)),
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    transaction.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  amount(transaction.amount)
                ],
              )
            ],
          ),
        )
      )
    );
  }
}

Text amount(double amount) {
  return Text(
    HelperFunction().moneyFormatter(currency: 'krw', amount: amount),
    style: TextStyle(
        color: amount >= 0 ? Colors.red : Colors.blue,
        fontSize: 18,
        fontWeight: FontWeight.w500
    ),
  );
}
