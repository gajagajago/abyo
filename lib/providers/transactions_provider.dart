import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'transaction.dart';

class TransactionsProvider with ChangeNotifier {
  List<Transaction> _transactions;
  bool loading = false;

  TransactionsProvider({@required String authToken}) {
    fetchTransactions(authToken);
  }

  List<Transaction> get transactions => _transactions;

  Future fetchTransactions(String authToken) async {
    try {
      loading = true;
      String url = Platform.isAndroid
          ? 'http://10.0.2.2:3000/api/v1/transactions'
          : 'http://127.0.0.1:3000/api/v1/transactions';
      final response = await http.get(
          url,
          headers: {'Content-Type': "application/json", 'AUTH-TOKEN': authToken}
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        _transactions = jsonList.map((e) => Transaction.fromJson(e)).toList();
        loading = false;
      }
    } catch (e) {
      print(e);
    } finally {
      print(transactions[0].title);
      notifyListeners();
    }
  }
}
