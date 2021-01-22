import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'assets.dart';
import '../../modals/modal_add_transaction.dart';

class AssetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AssetAppState();
  }
}

class _AssetAppState extends State<AssetApp> {
  Future<List<dynamic>> assets;

  _AssetAppState({this.assets});

  @override
  void initState() {
    super.initState();
    assets = fetchAssets();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Asset App'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: FutureBuilder(
                future: assets,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Assets(assets);
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ),
            // FutureBuilder<TransactionTable>(
            //   future: transactions,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Expanded(
            //         child: ListView(
            //           scrollDirection: Axis.vertical,
            //           shrinkWrap: true,
            //           children: [
            //             ...(snapshot.data.transactions as List<dynamic>)
            //                 .map((t) => Transaction(t))
            //           ],
            //         ),
            //       );
            //     } else if (snapshot.hasError) {
            //       return Text('sorry');
            //     } else {
            //       return CircularProgressIndicator();
            //     }
            //   },
            // ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showMaterialModalBottomSheet(
            context: context,
            builder: (context) => ModalAddTransaction(),
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
    print('fetched asset info');
    print(response.body);
    return jsonDecode(response.body);
  } else {
    return null;
  }
}
