import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _question;

  Question(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          'Q. $_question',
          style: TextStyle(
            fontSize: 18,
          ),
      ),
      margin: EdgeInsets.only(bottom: 20),
    );
  }
}
