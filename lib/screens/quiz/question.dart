import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;

  Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          'Q. $question',
          style: TextStyle(
            fontSize: 18,
          ),
      ),
      margin: EdgeInsets.only(bottom: 20),
    );
  }
}
