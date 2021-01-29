import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final _appBar = appBar(title: '내 자산관리');

    return MaterialApp(
      home: Scaffold(
        appBar: _appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height - _appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.17,
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
              Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height - _appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.83,
                child: FutureBuilder(
                  future: transactions,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, idx) {
                          return Transaction(snapshot.data[idx], initAssets, initTransactions);
                        },
                        itemCount: snapshot.data.length,
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (context) => FutureBuilder(
              future: assets,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ModalAddTransaction(snapshot.data as List<dynamic>, initAssets, initTransactions);
                } else {
                  return Container();
                }
              }
            ),
          ),
          child: Icon(Icons.add_rounded),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

Future<List<dynamic>> fetchAssets() async {
  var url = Platform.isAndroid ? 'http://10.0.2.2:3000/api/v1/assets' : 'http://127.0.0.1:3000/api/v1/assets';
  var authToken = await FlutterSession().get('authentication_token');
  final response = await http.get(
    url,
    headers: { 'AUTH-TOKEN': authToken }
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return null;
  }
}

Future<List<dynamic>> fetchTransactions() async {
  var url = Platform.isAndroid ? 'http://10.0.2.2:3000/api/v1/transactions' : 'http://127.0.0.1:3000/api/v1/transactions';
  var authToken = await FlutterSession().get('authentication_token');
  final response = await http.get(
      url,
      headers: { 'AUTH-TOKEN': authToken }
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return null;
  }
}
