import 'package:flutter/material.dart';
import '../../commons/app_bar.dart';

class ShopApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShopAppState();
  }
}

class _ShopAppState extends State<ShopApp> {
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight * 2 - MediaQuery.of(context).padding.vertical;

    return Scaffold(
      body: Container(
        height: bodyHeight,
      ),
    );
  }
}
