import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'screens/home/home_app.dart';
import 'screens/quiz/quiz_app.dart';
import 'screens/expense/expense_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeApp(),
        '/quiz': (context) => QuizApp(),
        '/expense': (context) => ExpenseApp(),
      },
    );
  }
}
