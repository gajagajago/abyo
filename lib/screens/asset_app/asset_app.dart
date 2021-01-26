import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'assets.dart';
import 'transaction.dart';
import '../../modals/modal_add_transaction.dart';

class AssetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AssetAppState();
  }
}

class _AssetAppState extends State<AssetApp> {
  Future<List<dynamic>> assets;
  Future<List<dynamic>> transactions;

  _AssetAppState({this.assets, this.transactions});

  @override
  void initState() {
    super.initState();
    assets = fetchAssets();
    transactions = fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('내 자산관리'),
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: assets,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Assets(snapshot.data as List<dynamic>);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            FutureBuilder(
              future: transactions,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 650, // should alter later
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, idx) {
                        return Transaction(snapshot.data[idx]);
                      },
                      itemCount: snapshot.data.length,
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showMaterialModalBottomSheet(
            context: context,
            builder: (context) => ModalAddTransaction(assets),
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
    print((jsonDecode(response.body) as List<dynamic>).length);
    return jsonDecode(response.body);
  } else {
    return null;
  }
}
