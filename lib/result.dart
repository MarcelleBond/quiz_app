import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultText {
    var result = "";

    if (resultScore <= 30) {
      result = "you're okay!";
    } else if (resultScore <= 40) {
      result = "You're cool";
    } else if (resultScore <= 50) {
      result = "You are awesome";
    } else {
      result = "You are the best out there";
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultText,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            child: const Text("Reset Quiz"),
          )
        ],
      ),
    );
  }
}
