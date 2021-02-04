import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/asset_app/inherited_modal_add_transaction.dart';

class SearchedStockList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchedStockListState();
  }
}

class _SearchedStockListState extends State<SearchedStockList> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> _searchedStockList = InheritedModalAddTransaction.of(context).modalAddTransactionState.searchedStockList;

    return Positioned(
        top: 170,
        child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: _searchedStockList != null ? 150 : 0,
              width: MediaQuery.of(context).size.width - 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 0.5, color: Colors.black26),
                    right: BorderSide(width: 0.5, color: Colors.black26),
                    bottom: BorderSide(width: 0.5, color: Colors.black26),
                  )
              ),
              child: ListView.builder(
                itemCount: _searchedStockList != null ? _searchedStockList.length : 0,
                itemBuilder: (BuildContext context, int idx) {
                  return Container(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(_searchedStockList[idx]['name'], style: TextStyle(fontSize: 16),),
                            Text(_searchedStockList[idx]['code']),
                          ],
                        )
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Colors.black12
                            )
                        )
                    ),
                  );
                },
              ),
            )
        )
    );
  }
}
