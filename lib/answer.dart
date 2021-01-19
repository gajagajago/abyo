import 'package:flutter/material.dart';

class Answer extends StatelessWidget{
  final String _answer;
  final Function _func;

  Answer(this._answer, this._func);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
          child: Text(_answer),
          onPressed: _func,
      )
    );
  }
}
