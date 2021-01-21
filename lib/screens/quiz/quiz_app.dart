import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:http/http.dart' as http;

import 'quiz.dart';
import 'finish.dart';

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  Future<QuestionTable> futureQuestionTable;
  int _qIdx = 0;
  int _score = 0;

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
  void initState() {
    super.initState();
    futureQuestionTable = fetchQuestionTable();
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
            children:
            [
              ConditionalBuilder(
                  condition: _qIdx <= 2,
                  builder: (context) => FutureBuilder<QuestionTable>(
                    future: futureQuestionTable,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Quiz(_qIdx, snapshot.data.questions, _answerQuestion);
                      } else if (snapshot.hasError) {
                        return Text('sorry');
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  fallback: (context) => Finish(_reset, _score),
              )
            ],
          ),
        )
      ),
    );
  }
}

class QuestionTable {
  var questions;

  QuestionTable({this.questions});

  factory QuestionTable.fromJson(List <dynamic> json) {
    return QuestionTable(questions: json);
  }
}

Future<QuestionTable> fetchQuestionTable() async {
  var url = Platform.isAndroid ? 'http://10.0.2.2:3000/api/v1/questions' : 'http://127.0.0.1:3000/api/v1/questions';
  final response =
  await http.get(url);

  if (response.statusCode == 200) {
    return QuestionTable.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load questions');
  }
}
