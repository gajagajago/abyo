import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'dart:convert';

class StockSearcher extends StatefulWidget {
  final Function changeFormKey;

  StockSearcher(this.changeFormKey);

  @override
  State<StatefulWidget> createState() {
    return _StockSearcherState();
  }
}

class _StockSearcherState extends State<StockSearcher> {
  List<dynamic> krxMktStock;
  List<dynamic> searchedStockList;

  @override
  void initState() {
    super.initState();
    fetchStocks();
  }

  Future<void> fetchStocks() async {
    var url = Platform.isAndroid
        ? 'http://10.0.2.2:3000/api/v1/stocks'
        : 'http://127.0.0.1:3000/api/v1/stocks';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      krxMktStock = jsonDecode(response.body);
    }
  }

  void _searchStock(String value) {
    setState(() {
      searchedStockList = krxMktStock.where((e) => e['name'].contains(value)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (val) => _searchStock(val),
        ),
        ConditionalBuilder(
            condition: searchedStockList != null,
            builder: (context) {
              return Positioned(
                child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        height: 200
                    ),
                    child: ListView.builder(
                      itemCount: searchedStockList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Text(searchedStockList[index]['name']),
                            )
                        );
                      },
                    )
                )
              );
            }
        ),
      ],
    );
  }
}
