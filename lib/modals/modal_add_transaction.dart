import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_quiz/modals/transaction_amount_text_field.dart';
import 'package:flutter_quiz/modals/transaction_date_picker.dart';
import 'package:flutter_quiz/modals/transaction_title_text_field.dart';
import 'package:flutter_quiz/providers/assets_provider.dart';
import 'package:flutter_quiz/screens/asset_app/inherited_modal_add_transaction.dart';
import 'positive_toggle_switch.dart';
import 'asset_category_chip.dart';
import 'transaction_title_text_field.dart';
import 'searched_stock_list.dart';
import 'transaction_amount_text_field.dart';
import 'transaction_date_picker.dart';
import 'package:provider/provider.dart';
import '../providers/authenticate.dart';
import '../providers/transactions_provider.dart';

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
    final assetsProvider = context.read<AssetsProvider>();
    final transactionsProvider = context.read<TransactionsProvider>();
    final authToken = context.read<Authenticate>().authToken;

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
                            transactionsProvider.createTransaction(params: formKey, authToken: authToken).then((val) {
                              if (val) {
                                Navigator.of(context).pop();
                                assetsProvider.fetchAssets(authToken);
                                transactionsProvider.fetchTransactions(authToken);
                              } else {
                                print("Error");
                              }
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
