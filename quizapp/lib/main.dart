import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/SplashScreen.dart';
import 'QuizQuestion.dart';

QuizQuestion quizQuestion = new QuizQuestion();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
int obtainMarks = 0;
bool listFinished = true;
// String displayQuestion = QuizQuestion.getQuestion();

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  void checkAnswer(bool userValue) {
    if (listFinished == true) {
      if (userValue == quizQuestion.rightBoolvalue()) {
        setState(() {
          quizQuestion.checkIcon();

          obtainMarks = obtainMarks + 2;
        });
      } else {
        setState(() {
          quizQuestion.closeIcon();
        });
      }
      setState(() {
        quizQuestion.nextQuestion();
      });
    }
  }

  void refresh() {
    setState(() {});
  }

  int num = 1 + quizQuestion.questionNumber();
  int totalQuestion = quizQuestion.questionBank.length;

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
                        'Quiz : $totalQuestion',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 200,
                      ),
                      const Text(
                        'Timer ',
                        style: TextStyle(
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
                        top: 95, bottom: 95, left: 25, right: 25),
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
                      top: 60,
                      child: CircleAvatar(
                        radius: 34,
                        backgroundColor: const Color.fromRGBO(33, 44, 59, 1),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color.fromRGBO(33, 44, 59, 1),
                          child: Text(
                            '$num',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
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
