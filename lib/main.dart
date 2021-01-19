import 'package:flutter/material.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter_quiz/quiz.dart';

import 'quiz.dart';
import 'finish.dart';


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
  int _score = 0;
  var _questions = const [
    {
      'q': '1 + 10',
      'answers': [
        {
          'answer': '11',
          'correct': true
        },
        {
          'answer': '21',
          'correct': false
        },
        {
          'answer': '31',
          'correct': false
        }
      ]
    },
    {
      'q': '2 * 20',
      'answers': [
        {
          'answer': '40',
          'correct': true
        },
        {
          'answer': '21',
          'correct': false
        },
        {
          'answer': '31',
          'correct': false
        }
      ]    },
    {
      'q': '3 * 7',
      'answers': [
        {
          'answer': '11',
          'correct': false
        },
        {
          'answer': '21',
          'correct': true
        },
        {
          'answer': '31',
          'correct': false
        }
      ]    }
  ];

  void _answerQuestion(bool correct) {
    if (correct) _score ++;

    setState(() {
      _qIdx ++;
    });
  }

  void _reset() {
    setState(() {
      _qIdx = 0;
      _score = 0;
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
              ConditionalBuilder(
                  condition: _qIdx <= 2,
                  builder: (context) => Quiz(_qIdx, _questions, _answerQuestion),
                  fallback: (context) => Finish(_reset, _score),
              )
            ],
          ),
        )
      ),
    );
  }
}
