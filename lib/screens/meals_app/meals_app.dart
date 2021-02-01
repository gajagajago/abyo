import 'package:flutter/material.dart';
import '../../commons/app_bar.dart';

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
