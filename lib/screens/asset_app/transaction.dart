import 'package:flutter/material.dart';
import '../../helpers/helper_function.dart';

class Transaction extends StatelessWidget {
  final Map<String, dynamic> transaction;

  Transaction(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4
      ),
      padding: EdgeInsets.all(8),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                HelperFunction().assetCategory(transaction['asset_category']),
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              Text(
                'time',
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
                transaction['title'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              amount(transaction['amount'])
            ],
          )
        ],
      ),
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
