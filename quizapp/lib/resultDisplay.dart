// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:quizapp/Question.dart';

class ResutDisplay extends StatelessWidget {
  final List<Question> rightAnswer;
  final List<Question> wrongAnswer;
  ResutDisplay(this.rightAnswer, this.wrongAnswer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen'),
      ),
      body: Center(),
    );
  }
}
