// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizapp/Question.dart';

import 'main.dart';

class QuizQuestion {
  List<Question> questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was\"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  int _questionNumber = 0;

  void closeIcon() {
    iconList.add(
      const Icon(
        Icons.close,
        color: Colors.red,
        size: 20,
      ),
    );
  }

  void checkIcon() {
    iconList.add(
      const Icon(
        Icons.check,
        color: Colors.green,
        size: 20,
      ),
    );
  }

  String getQuestion() {
    return questionBank[_questionNumber].questionText;
  }

  void nextQuestion() {
    if (_questionNumber < questionBank.length - 1) {
      _questionNumber++;
    } else {
      listFinished =
          false; // IT will false when the every element of list is visited
    }
  }

  void reSet() {
    _questionNumber = 0;
  }

  bool rightBoolvalue() {
    return questionBank[_questionNumber].rightAnswer;
  }

  void rightAnswer() {
    obtainMarks = obtainMarks + 2;

    checkIcon();
  }

  void wrongAnswer() {
    _questionNumber++;
    closeIcon();
  }

  int questionNumber() {
    int hel = 2 + _questionNumber;
    return hel;
  }
}
