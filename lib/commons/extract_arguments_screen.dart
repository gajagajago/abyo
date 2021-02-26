import 'package:flutter/material.dart';

class ExtractArgumentsScreen extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;

  const ExtractArgumentsScreen({
    Key key,
    @required this.appBar,
    @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
