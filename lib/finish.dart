import 'package:flutter/material.dart';

class Finish extends StatelessWidget {
  final Function _func;
  final int _score;

  Finish(this._func, this._score);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('Score: $_score'),
        onPressed: _func
    );
  }

}
