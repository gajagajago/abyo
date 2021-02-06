import 'package:flutter/material.dart';
import 'package:flutter_quiz/modals/transaction_title_text_field.dart';
import 'package:flutter_quiz/screens/asset_app/inherited_modal_add_transaction.dart';

class SearchedStockList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchedStockListState();
  }
}

class _SearchedStockListState extends State<SearchedStockList> {
  void selectStock({String title, String code}) {
    InheritedModalAddTransaction.of(context).modalAddTransactionState.setFormKey(
      key: 'title',
      value: title
    );
    InheritedModalAddTransaction.of(context).modalAddTransactionState.setFormKey(
        key: 'stock_code',
        value: code
    );

    TransactionTitleTextFieldState.stockController.text = title;
    InheritedModalAddTransaction.of(context).modalAddTransactionState.setSearchedStockList(list: null);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> _searchedStockList = InheritedModalAddTransaction.of(context).modalAddTransactionState.searchedStockList;
    bool isStock = InheritedModalAddTransaction.of(context).modalAddTransactionState.formKey['asset_category'] == 'stock';

    if (isStock && _searchedStockList != null && _searchedStockList.length > 0) {
      return Positioned(
          top: 160,
          child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                height: 180,
                width: MediaQuery.of(context).size.width - 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 0),
                    left: BorderSide(width: 0.5, color: Colors.black26),
                    right: BorderSide(width: 0.5, color: Colors.black26),
                    bottom: BorderSide(width: 0.5, color: Colors.black26),
                  )
                ),
                child: ListView.builder(
                  itemCount: _searchedStockList.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return Container(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: InkWell(
                            child: Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Text(
                                        _searchedStockList[idx]['name'],
                                        style: TextStyle(fontSize: 16)
                                    )
                                ),
                                Text(_searchedStockList[idx]['code']),
                              ],
                            ),
                            onTap: () {
                              selectStock(title: _searchedStockList[idx]['name'], code: _searchedStockList[idx]['code']);
                            },
                          )
                      ),
                    );
                  },
                ),
              )
          )
      );
    } else {
      return Container();
    }
  }
}
