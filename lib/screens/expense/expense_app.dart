import 'package:flutter/material.dart';

class ExpenseApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExpenseAppState();
  }
}

class _ExpenseAppState extends State<ExpenseApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense App'),
        ),
        body: Container(
          child: Column(
            children: [
              Card(
                child: Text('alallal'),
              ),
              Card()
            ],
          ),
        ),
      ),
    );
  }
}
