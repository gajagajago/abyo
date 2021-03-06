import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'transaction.dart';
import '../../helpers/http_request.dart';

class TransactionsProvider with ChangeNotifier {
  List<Transaction> _transactions;
  bool loading = false;

  TransactionsProvider({@required String authToken}) {
    fetchTransactions(authToken);
  }

  List<Transaction> transactions(dynamic assetCategoryId) {
    return assetCategoryId == null
        ? _transactions
        : _transactions.where((e) => e.asset['id'] == assetCategoryId).toList();
  }

  Future fetchTransactions(String authToken) async {
    try {
      loading = true;
      await HttpRequest()
          .get(partialUrl: "transactions", authToken: authToken)
          .then((response) {
        final List<dynamic> jsonList = json.decode(response.body);
        _transactions = jsonList.map((e) => Transaction.fromJson(e)).toList();
        loading = false;
      });
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }

  Future createTransaction(
      {Map<String, dynamic> params, String authToken}) async {
    Map<String, dynamic> paramsFormat = {
      'title': params['title'],
      'amount': params['positive'] ? params['amount'] : '-${params['amount']}',
      'time': params['time'],
      'stock_code':
          params['asset_category'] == 'stock' ? params['stock_code'] : null
    };

    try {
      final response = await HttpRequest().post(
          partialUrl: "assets/${params['asset_id']}/transactions",
          authToken: authToken,
          body: paramsFormat);

      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
  }

  Future destroyTransaction({Map<String, int> params, String authToken}) async {
    try {
      final response = await HttpRequest().delete(
          partialUrl: "assets/${params['asset_id']}/transactions/${params['transaction_id']}",
          authToken: authToken
      );

      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
  }
}
