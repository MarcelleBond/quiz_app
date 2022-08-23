
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String,Object>> questions;
  final int questionsIndex;
  
  Quiz(this.answerQuestion, this.questions, this.questionsIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionsIndex]["question"] as String,
        ),
        ...(questions[questionsIndex]["answers"] as List<Map<String, Object>>).map(
          (answer) {
            return Answer(() => answerQuestion(answer["score"]), answer["text"] as String);
          },
        ).toList()
      ],
    );
  }
}
