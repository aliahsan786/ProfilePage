import 'dart:async';
// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizapp/SplashScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Question.dart';
import 'QuizQuestion.dart';
import 'resultDisplay.dart';

QuizQuestion quizQuestion = new QuizQuestion();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizApp',
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}

List<Icon> iconList = [
  const Icon(
    Icons.arrow_forward,
    color: Colors.white,
  )
];
List<Question> rightAnswers = [];
List<Question> wrongAnswers = [];
int number = 1;

int obtainMarks = 0;
bool listFinished = true;

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

int totalQuestion = quizQuestion.questionBank.length;
int remainQuestion = quizQuestion.questionBank.length;

class _QuizAppState extends State<QuizApp> {
//down navigator to next screen
  getItemAndNavigate(BuildContext context) {
    Navigator.push(
      // ignore: prefer_const_constructors
      context,
      MaterialPageRoute(
          builder: (context) => ResutDisplay(rightAnswers, wrongAnswers)),
    );
  }
//uper navigator to next Screen

  int _seconds = 00;
  int _minutes = quizQuestion.questionBank.length ~/ 2;
  Timer _timer = Timer.periodic(const Duration(seconds: 1), (_) {});
  void _startTimer() {
    // ignore: unnecessary_null_comparison
    if (_timer != null) {
      _timer.cancel();
    }
    if (_minutes > 0) {
      _seconds = _minutes * 60;
    }
    if (_seconds > 0) {
      _minutes = (_seconds / 60).floor();
      _seconds -= (_minutes * 60);
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _seconds = 59;
            _minutes--;
          } else {
            _timer.cancel();
            print('Timer is completed');
            setState(() {
              listFinished = false;
            });
          }
        }
      });
    });
  }

  void checkAnswer(bool userValue) {
    if (listFinished == true) {
      if (userValue == quizQuestion.rightBoolvalue()) {
        setState(() {
          quizQuestion.checkIcon();
          remainQuestion = remainQuestion - 1;
          rightAnswers.add(
              quizQuestion.questionBank[quizQuestion.questionNumber() - 2]);
          obtainMarks = obtainMarks + 2;
          number = quizQuestion.questionNumber();
          // remainQuestion = quizQuestion.remainQuestion();
        });
      } else {
        setState(() {
          quizQuestion.closeIcon();
          remainQuestion = remainQuestion - 1;
          wrongAnswers.add(
              quizQuestion.questionBank[quizQuestion.questionNumber() - 2]);

          number = quizQuestion.questionNumber();
          // remainQuestion = quizQuestion.remainQuestion();
        });
      }
      setState(() {
        quizQuestion.nextQuestion();
      });
    } else {
      setState(() {
        Alert(
                context: context,
                title: 'Finished!',
                desc: 'You\'ve reached the end of the quiz.',
                closeFunction: getItemAndNavigate(context))
            .show();
        quizQuestion.reSet();
        number = 1;
        _seconds = 0;
        _minutes = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 44, 59, 1),
        title: const Text('QuizApp'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(25, 29, 42, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quiz : ${remainQuestion} / ${totalQuestion}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 175,
                      ),
                      Text(
                        '${_minutes} : ${_seconds}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 70, bottom: 70, left: 25, right: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white70,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          quizQuestion.getQuestion(),
                          style: const TextStyle(
                              color: Color.fromRGBO(33, 44, 59, 1),
                              // backgroundColor: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      // left: MediaQuery.of(context).size.width / 2,
                      top: 20,
                      child: CircleAvatar(
                        radius: 34,
                        backgroundColor: Colors.white30,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color.fromRGBO(33, 44, 59, 1),
                          child: Text(
                            '$number',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                child: MaterialButton(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 10, bottom: 10),
                  color: Colors.white70,
                  onPressed: () {
                    checkAnswer(true);
                    _startTimer();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minWidth: 320,
                  height: 40,
                  child: const Text(
                    'True',
                    style: TextStyle(
                        color: Color.fromRGBO(33, 44, 59, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 30),
              child: MaterialButton(
                elevation: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                color: Colors.white70,
                onPressed: () {
                  checkAnswer(false);
                },
                minWidth: 320,
                height: 40,
                child: const Text(
                  'False',
                  style: TextStyle(
                      color: Color.fromRGBO(33, 44, 59, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: iconList,
            ),
          ],
        ),
      ),
    );
  }
}
