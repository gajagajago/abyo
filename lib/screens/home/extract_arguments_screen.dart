import 'package:flutter/material.dart';
import '../../commons/app_bar.dart';

class ExtractArgumentsScreen extends StatelessWidget {
  final String appBarTitle;
  final Widget body;

  const ExtractArgumentsScreen({
    Key key,
    @required this.appBarTitle,
    @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: appBarTitle),
      body: body,
    );
  }
}
