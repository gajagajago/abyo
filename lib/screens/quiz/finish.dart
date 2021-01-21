import 'package:flutter/material.dart';

class Finish extends StatelessWidget {
  final Function func;
  final int score;

  Finish(this.func, this.score);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('Score: $score'),
        onPressed: func
    );
  }

}
