import 'dart:convert';
import 'dart:io' show Platform;

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;

class MealsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MealsAppState();
  }
}

class _MealsAppState extends State<MealsApp> {
  List<dynamic> stocks;
  List<dynamic> searchedResults;

  _MealsAppState({this.stocks});

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
      stocks = jsonDecode(response.body);
    }
  }

  void _searchStock(String value) {
    setState(() {
      searchedResults = stocks.where((e) => e['name'].contains(value)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight - kBottomNavigationBarHeight - MediaQuery.of(context).padding.vertical;

    return Scaffold(
      body: Container(
        height: bodyHeight,
        child: Center(
          child: Column(
            children: [
              TextField(
                onChanged: (val) => _searchStock(val),
              ),
              ConditionalBuilder(
                condition: searchedResults != null,
                builder: (context) {
                  return ConstrainedBox(
                    constraints: BoxConstraints.tightFor(height: bodyHeight * 0.7),
                    child: ListView.builder(
                      itemCount: searchedResults.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(searchedResults[index]['name']),
                              Text(searchedResults[index]['code'])
                            ],
                          ),
                        );
                      },
                    )
                  );
                }
              ),
            ],
          )
        ),
      ),
    );
  }
}

Future<dynamic> xmlToMap() async {
  String stockCode = "041190";
  String url = "http://asp1.krx.co.kr/servlet/krx.asp.XMLSise?code=$stockCode";

  final response = await http.get(url);

  if(response.statusCode == 200) {
    xml.XmlDocument data = xml.XmlDocument.parse(response.body);
    String price = data.findAllElements('DailyStock').first.getAttribute('day_EndPrice');
    print(price);

  }

}
