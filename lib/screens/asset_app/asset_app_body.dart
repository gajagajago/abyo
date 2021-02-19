import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'assets.dart';
import 'transaction.dart';
import '../../modals/modal_add_transaction.dart';

class AssetAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight -
        kBottomNavigationBarHeight;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: bodyHeight * 0.2,
            child: Assets(),
          )
        ],
      ),
    );
  }

}
