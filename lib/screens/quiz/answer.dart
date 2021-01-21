import 'package:flutter/material.dart';

class Answer extends StatelessWidget{
  final Map<String, Object> answer;
  final Function func;

  Answer(this.answer, this.func);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
          child: Text(answer['answer']),
          onPressed: func,
      )
    );
  }
}
