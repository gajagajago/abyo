import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/asset_app/inherited_asset_app.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'assets.dart';
import 'transaction.dart';
import '../../modals/modal_add_transaction.dart';
import '../../commons/app_bar.dart';

class AssetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AssetAppState();
  }
}

class AssetAppState extends State<AssetApp> {
  Future<List<dynamic>> assets;
  Future<List<dynamic>> transactions;
  int assetCategoryId;

  AssetAppState({this.assets, this.transactions});

  @override
  void initState() {
    super.initState();
    initAssets();
    initTransactions();
  }

  void initAssets() {
    setState(() {
      assets = fetchAssets();
    });
  }

  void initTransactions() {
    setState(() {
      transactions = fetchTransactions();
    });
  }

  void setCategory(int assetId) {
    setState(() {
      assetCategoryId = assetId;
    });
  }

  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight -
        kBottomNavigationBarHeight;

    return InheritedAssetApp(
      child: Scaffold(
        appBar: appBar(title: '자산관리'),
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: bodyHeight * 0.2,
                child: FutureBuilder(
                  future: assets,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Assets(snapshot.data as List<dynamic>);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height: bodyHeight * 0.8 - 27, // temp
                  ),
                  child: FutureBuilder(
                      future: transactions,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var transactionList = assetCategoryId != null
                              ? [...snapshot.data]
                              .where((e) => e['asset']['id'] == assetCategoryId)
                              .toList()
                              : [...snapshot.data];

                          return ListView.builder(
                            itemBuilder: (context, idx) {
                              return Transaction(
                                  transactionList[idx], initAssets, initTransactions);
                            },
                            itemCount: transactionList.length,
                          );
                        } else {
                          return Container();
                        }
                      }))
            ])),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (context) => FutureBuilder(
                future: assets,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ModalAddTransaction(snapshot.data as List<dynamic>,
                        initAssets, initTransactions);
                  } else {
                    return Container();
                  }
                }),
          ),
          child: Icon(Icons.add_rounded),
          backgroundColor: Colors.blue,
        ),
      ),
      assetAppState: this,
    );
  }
}

Future<List<dynamic>> fetchAssets() async {
  var url = Platform.isAndroid
      ? 'http://10.0.2.2:3000/api/v1/assets'
      : 'http://127.0.0.1:3000/api/v1/assets';
  var authToken = await FlutterSession().get('authentication_token');
  final response = await http.get(url, headers: {'AUTH-TOKEN': authToken});

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return null;
  }
}

Future<List<dynamic>> fetchTransactions() async {
  var url = Platform.isAndroid
      ? 'http://10.0.2.2:3000/api/v1/transactions'
      : 'http://127.0.0.1:3000/api/v1/transactions';
  var authToken = await FlutterSession().get('authentication_token');
  final response = await http.get(url, headers: {'AUTH-TOKEN': authToken});

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return null;
  }
}
