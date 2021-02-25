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

  List<Transaction> transactions(dynamic assetCategoryId) {
    return assetCategoryId == null
        ? _transactions
        : _transactions.where((e) => e.asset['id'] == assetCategoryId).toList();
  }

  Future fetchTransactions(String authToken) async {
    try {
      loading = true;
      String url = Platform.isAndroid
          ? 'http://10.0.2.2:3000/api/v1/transactions'
          : 'http://127.0.0.1:3000/api/v1/transactions';
      final response = await http.get(url, headers: {
        'Content-Type': "application/json",
        'AUTH-TOKEN': authToken
      });

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        _transactions = jsonList.map((e) => Transaction.fromJson(e)).toList();
        loading = false;
      }
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }

  Future createTransaction({Map<String, dynamic> params, String authToken}) async {
    Map<String, dynamic> paramsFormat = {
      'title': params['title'],
      'amount': params['positive'] ? params['amount'] : '-${params['amount']}',
      'time': params['time'],
      'stock_code': params['asset_category'] == 'stock' ? params['stock_code'] : null
    };

    String url = Platform.isAndroid
        ? 'http://10.0.2.2:3000/api/v1/assets/${params['asset_id']}/transactions'
        : 'http://127.0.0.1:3000/api/v1/assets/${params['asset_id']}/transactions';

    try {
      final response = await http.post(url,
          headers: {'Content-Type': "application/json", 'AUTH-TOKEN': authToken},
          body: jsonEncode(paramsFormat)
      );

      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
  }

  Future destroyTransaction({Map<String, int> params, String authToken}) async {
    String url = Platform.isAndroid
        ? "http://10.0.2.2:3000/api/v1/assets/${params['asset_id']}/transactions/${params['transaction_id']}"
        : "http://127.0.0.1:3000/api/v1/assets/${params['asset_id']}/transactions/${params['transaction_id']}";

    try {
      final response = await http.delete(
          url,
          headers: {'Content-Type': "application/json", 'AUTH-TOKEN': authToken},
      );

      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
  }
}
