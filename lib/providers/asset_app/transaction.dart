import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Transaction with ChangeNotifier {
  final int id;
  final String title;
  final double amount;
  final String time;
  final dynamic asset;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.time,
    @required this.asset,
  });

  factory Transaction.fromJson(dynamic json) {
    return Transaction(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      time: json['time'],
      asset: json['asset']
    );
  }
}
