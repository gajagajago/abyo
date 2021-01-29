import 'package:flutter/material.dart';
import '../../helpers/helper_function.dart';

class Asset extends StatelessWidget {
  final Map<String, dynamic> asset;

  Asset(this.asset);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          setIcon(asset['category']),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text('${HelperFunction().moneyFormatter(currency: 'krw', amount: asset['amount'])}')
          )
        ],
      )
    );
  }
}

Icon setIcon(String category) {
  if (category == 'credit') {
    return Icon(Icons.credit_card);
  } else if (category == 'stock') {
    return Icon(Icons.show_chart);
  } else if (category == 'real_estate') {
    return Icon(Icons.apartment);
  } else if (category == 'bank') {
    return Icon(Icons.account_balance_wallet);
  } else if (category == 'cash') {
    return Icon(Icons.money);
  } else {
    return Icon(Icons.more_horiz);
  }
}
