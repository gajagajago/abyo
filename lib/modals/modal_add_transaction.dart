import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_quiz/modals/transaction_amount_text_field.dart';
import 'package:flutter_quiz/modals/transaction_date_picker.dart';
import 'package:flutter_quiz/modals/transaction_title_text_field.dart';
import 'package:flutter_quiz/screens/asset_app/inherited_modal_add_transaction.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'positive_toggle_switch.dart';
import 'asset_category_chip.dart';
import 'transaction_title_text_field.dart';
import 'searched_stock_list.dart';
import 'transaction_amount_text_field.dart';
import 'transaction_date_picker.dart';

class ModalAddTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ModalAddTransactionState();
  }
}

class ModalAddTransactionState extends State<ModalAddTransaction> {
  Map<String, dynamic> formKey;
  List<dynamic> searchedStockList;

  @override
  void initState() {
    super.initState();
    initFormKey();
    initSearchedStockList();
  }

  void initFormKey() {
    setState(() {
      formKey = {
        'asset_category': null,
        'asset_id': null,
        'title': null,
        'stock_code': null,
        'amount': null,
        'positive': true,
        'time': null,
      };
    });
  }

  void initSearchedStockList() {
    setState(() {
      searchedStockList = null;
    });
  }

  void setFormKey({String key, dynamic value}) {
    setState(() {
      formKey[key] = value;
    });
  }

  void setSearchedStockList({List<dynamic> list}) {
    setState(() {
      searchedStockList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedModalAddTransaction(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
              )
          ),
          margin: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Column(
                  children: [
                    PositiveToggleSwitch(),
                    AssetCategoryChip(),
                    TransactionTitleTextField(),
                    TransactionAmountTextField(),
                    TransactionDatePicker(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          child: Text("저장"),
                          onPressed: () {
                            createTransaction(formKey).then((val) => {
                              // widget.initAssets(),
                              // widget.initTransactions(),
                              Navigator.of(context).pop()
                            });
                          }
                        ),
                        MaterialButton(
                          child: Text("초기화"),
                          onPressed: () {
                            initFormKey();
                          },
                        ),
                      ],
                    )
                  ]
                ),
                SearchedStockList(),
              ],
            )
          )
        )
      ),
      modalAddTransactionState: this,
    );
  }
}

Future<bool> createTransaction(var params) async {
  Map<String, dynamic> paramsFormat = {
    'title': params['title'],
    'amount': params['positive'] ? params['amount'] : '-${params['amount']}',
    'time': params['time'],
    'stock_code': params['asset_category'] == 'stock' ? params['stock_code'] : null
  };

  var url = Platform.isAndroid
      ? 'http://10.0.2.2:3000/api/v1/assets/${params['asset_id']}/transactions'
      : 'http://127.0.0.1:3000/api/v1/assets/${params['asset_id']}/transactions';
  var authToken = await FlutterSession().get('authentication_token');

  final response = await http.post(url,
      headers: {'Content-Type': "application/json", 'AUTH-TOKEN': authToken},
      body: jsonEncode(paramsFormat)
  );

  return response.statusCode == 200;
}
