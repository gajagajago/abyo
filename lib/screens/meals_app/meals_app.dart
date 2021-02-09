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
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight - kBottomNavigationBarHeight - MediaQuery.of(context).padding.vertical;

    return Scaffold(
      body: Container(
        height: bodyHeight,
      ),
    );
  }
}
