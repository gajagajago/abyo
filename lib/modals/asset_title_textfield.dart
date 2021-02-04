import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/asset_app/inherited_modal_add_transaction.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

class AssetTitleTextfield extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AssetTitleTextfieldState();
  }
}

class _AssetTitleTextfieldState extends State<AssetTitleTextfield> {
  final titleController = TextEditingController();
  final stockController = TextEditingController();
  List<dynamic> krxMktStock;

  Future<void> fetchStocks() async {
    var url = Platform.isAndroid
        ? 'http://10.0.2.2:3000/api/v1/stocks'
        : 'http://127.0.0.1:3000/api/v1/stocks';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      krxMktStock = jsonDecode(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStocks();
    titleController.addListener(() {
      InheritedModalAddTransaction.of(context).modalAddTransactionState.setFormKey(key: 'title', value: titleController.text);
    });
    stockController.addListener(() {
      Future.delayed(Duration(seconds: 1), () {
        InheritedModalAddTransaction.of(context).modalAddTransactionState.setSearchedStockList(
            list: krxMktStock.where((e) => e['name'].contains(stockController.text)).toList()
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isStock = InheritedModalAddTransaction.of(context).modalAddTransactionState.formKey['asset_category'] == 'stock';

    if (isStock) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('종목명'),
            TextField(
              controller: stockController,
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('항목'),
            TextField(
              controller: titleController,
            ),
          ],
        ),
      );
    }
  }
}
