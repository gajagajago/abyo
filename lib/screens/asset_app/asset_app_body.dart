import 'package:flutter/material.dart';
import 'assets.dart';
import 'transactions.dart';

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
          ),
          Container(
            height: bodyHeight * 0.8 - 27,
            child: Transactions(),
          )
        ],
      ),
    );
  }

}
