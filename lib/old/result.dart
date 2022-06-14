import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuizMethod;

  Result(this.resultScore, this.resetQuizMethod);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Score: $resultScore",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
          ),
          TextButton(
            child: Text("Restart Quiz"),
            onPressed: resetQuizMethod,
          ),
        ],
      ),
    );
  }
}
