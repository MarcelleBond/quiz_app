import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionsIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      "question": "What is your favorite colour?",
      "answers": [
        {
          "text": "Red",
          "score": 15,
        },
        {
          "text": "Blue",
          "score": 10,
        },
        {
          "text": "Black",
          "score": 20,
        },
        {
          "text": "White",
          "score": 5,
        },
      ]
    },
    {
      "question": "What's your favorite animal?",
      "answers": [
        {
          "text": "Cat",
          "score": 20,
        },
        {
          "text": "Dog",
          "score": 15,
        },
        {
          "text": "Bird",
          "score": 5,
        },
        {
          "text": "Fish",
          "score": 10,
        },
      ]
    },
    {
      "question": "Who's the best partner in the world",
      "answers": [
        {
          "text": "Pebble Pops",
          "score": 20,
        },
        {
          "text": "Amo",
          "score": 20,
        },
        {
          "text": "Mo",
          "score": 20,
        },
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionsIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionsIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
        ),
        body: _questionsIndex < _questions.length
            ? Quiz(
                _answerQuestion,
                _questions,
                _questionsIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
