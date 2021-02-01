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
    return Scaffold(
      appBar: appBar(title: '쇼핑관리'),
    );
  }
}
