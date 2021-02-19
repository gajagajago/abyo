import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Asset {
  final int id;
  final String category;
  final double amount;

  Asset({@required this.id, @required this.category, @required this.amount});

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(id: json['id'], category: json['category'], amount: json['amount']);
  }
}
