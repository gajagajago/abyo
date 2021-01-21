import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Quiz App'),
              onPressed: () => Navigator.pushNamed(context, '/quiz'),
            ),
            RaisedButton(
              child: Text('Expense App'),
              onPressed: () => Navigator.pushNamed(context, '/expense'),
            )
          ],
        ),
      ),
    );
  }
}
