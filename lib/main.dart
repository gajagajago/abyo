import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _qIdx = 0;
  var _questions = const [
    {
      'q': 'First question',
      'answers': ['1','2','3','4']
    },
    {
      'q': 'Second question',
      'answers': ['1','2','3','4']
    },
    {
      'q': 'Third question',
      'answers': ['1','2','3','4']
    }
  ];

  void _answerQuestion() {
    setState(() {
      _qIdx = (_qIdx + 1) % _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Quiz App')
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Question(_questions[_qIdx]['q']),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...(_questions[_qIdx]['answers'] as List<String>)
                      .map((e) => Answer(e, _answerQuestion)).toList()
                ]
              )
            ],
          ),
        )
      ),
    );
  }
}
