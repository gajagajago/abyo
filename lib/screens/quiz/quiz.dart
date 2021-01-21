import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final int qIdx;
  final List<dynamic> questions;
  final Function answerQuestion;

  Quiz(this.qIdx, this.questions, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Question(questions[qIdx]['question']),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...(questions[qIdx]['answers'] as List<dynamic>)
                  .map((e) => Answer(e, () => answerQuestion(e['correct']))).toList()
            ],
          )
        ]
    );
  }

}
